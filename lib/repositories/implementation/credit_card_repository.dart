import 'dart:convert';

import 'package:cardwiz/core/errors/failures.dart';
import 'package:cardwiz/models/dto/credit_card/credit_card_dto.dart';
import 'package:cardwiz/repositories/interfaces/i_credit_card_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dartz/dartz.dart';

class CreditCardRepository implements ICreditCardRepository {
  static const _key = 'credit_cards';
  late SharedPreferences _preferences;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  @override
  Future<Either<Failure, void>> addCard(CreditCardDto card) async {
    try {
      final cards = await _getCardsOrThrow();

      if (cards.any((c) => c.cardNumber == card.cardNumber)) {
        return Left(DuplicateCardFailure());
      }

      cards.add(card);
      final jsonList = cards.map((c) => json.encode(c.toJson())).toList();
      final success = await _preferences.setStringList(_key, jsonList);

      if (!success) {
        return Left(CacheFailure("Failed to save the card."));
      }
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure("Failed to add the card."));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCard(String cardNumber) async {
    try {
      final cards = await _getCardsOrThrow();
      final initialLength = cards.length;
      cards.removeWhere((c) => c.cardNumber == cardNumber);
      final removed = cards.length < initialLength;

      if (!removed) return Left(CardNotFoundFailure());

      final jsonList = cards.map((c) => json.encode(c.toJson())).toList();
      final success = await _preferences.setStringList(_key, jsonList);

      if (!success) {
        return Left(CacheFailure("Failed to delete the card."));
      }
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CreditCardDto>>> getCards() async {
    try {
      final cards = await _getCardsOrThrow();
      return Right(cards);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  /// Helper method to get cards or throw CacheFailure
  Future<List<CreditCardDto>> _getCardsOrThrow() async {
    final jsonList = _preferences.getStringList(_key) ?? [];
    try {
      return jsonList
          .map((e) => CreditCardDto.fromJson(json.decode(e)))
          .toList();
    } catch (_) {
      throw CacheFailure("Failed to read stored cards.");
    }
  }
}
