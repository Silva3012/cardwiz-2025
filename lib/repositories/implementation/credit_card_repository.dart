import 'dart:convert';

import 'package:cardwiz/core/errors/failures.dart';
import 'package:cardwiz/core/utils/card_type_enum.dart';
import 'package:cardwiz/models/dto/country/country_dto.dart';
import 'package:cardwiz/models/dto/credit_card/credit_card_dto.dart';
import 'package:cardwiz/repositories/implementation/database_helper.dart';
import 'package:cardwiz/repositories/interfaces/i_credit_card_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;

@LazySingleton(as: ICreditCardRepository)
class CreditCardRepository implements ICreditCardRepository {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<Database> get _db async => await _dbHelper.database;

  @override
  Future<Either<Failure, void>> addCard(CreditCardDto card) async {
    try {
      final db = await _db;

      // Check for duplicates
      final existing = await db.query(
        'credit_cards',
        where: 'cardNumber = ?',
        whereArgs: [card.cardNumber],
      );

      if (existing.isNotEmpty) {
        return Left(DuplicateCardFailure());
      }

      await db.insert('credit_cards', {
        'cardNumber': card.cardNumber,
        'cardType': card.cardType.name,
        'cardHolderName': card.cardHolderName,
        'month': card.month,
        'year': card.year,
        'cvv': card.cvv,
        'issuingCountry': jsonEncode(card.issuingCountry.toJson()),
      });

      return const Right(null);
    } catch (e) {
      debugPrint('AddCard Error: $e');
      return Left(CacheFailure('Failed to add card'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCard(String cardNumber) async {
    try {
      final db = await _db;
      final deleted = await db.delete(
        'credit_cards',
        where: 'cardNumber = ?',
        whereArgs: [cardNumber],
      );

      if (deleted == 0) return Left(CardNotFoundFailure());

      return const Right(null);
    } catch (e) {
      debugPrint('DeleteCard Error: $e');
      return Left(CacheFailure('Failed to delete card'));
    }
  }

  @override
  Future<Either<Failure, List<CreditCardDto>>> getCards() async {
    try {
      final db = await _db;
      final maps = await db.query('credit_cards');

      final cards = maps.map((map) {
        return CreditCardDto(
          cardNumber: map['cardNumber'] as String,
          cardType: CardType.values.firstWhere(
            (e) => e.name == map['cardType'],
            orElse: () => CardType.invalid,
          ),
          cardHolderName: map['cardHolderName'] as String,
          month: map['month'] as int?,
          year: map['year'] as int?,
          cvv: map['cvv'] as int?,
          issuingCountry: CountryDto.fromJson(
            jsonDecode(map['issuingCountry'] as String),
          ),
        );
      }).toList();

      return Right(cards);
    } catch (e) {
      debugPrint('GetCards Error: $e');
      return Left(CacheFailure('Failed to load cards'));
    }
  }

  @override
  Future<Either<Failure, List<CountryDto>>> getCountries() async {
    try {
      final response = await http.get(
          Uri.parse('https://restcountries.com/v3.1/all?fields=name,cca2'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);

        final countries = jsonData.map((json) {
          return CountryDto(
            name: json['name']['common'],
            code: json['cca2'],
          );
        }).toList();

        countries.sort((a, b) => a.name.compareTo(b.name));

        return Right(countries);
      } else {
        return Left(ServerFailure('Failed to load countries'));
      }
    } catch (e) {
      debugPrint('GetCountries Error: $e');
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }
}
