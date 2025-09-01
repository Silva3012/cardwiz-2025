import 'dart:convert';
import 'package:cardwiz/core/utils/card_type_enum.dart';
import 'package:cardwiz/models/dto/country/country_dto.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:cardwiz/models/dto/credit_card/credit_card_dto.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'credit_card.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE credit_cards (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            cardNumber TEXT,
            cardType TEXT,
            cardHolderName TEXT,
            month INTEGER,
            year INTEGER,
            cvv INTEGER,
            issuingCountry TEXT
          )
        ''');
      },
    );
  }

  /// Insert a CreditCardDto into the database
  Future<void> insertCreditCard(CreditCardDto card) async {
    final db = await database;
    await db.insert('credit_cards', {
      'cardNumber': card.cardNumber,
      'cardType': card.cardType.name,
      'cardHolderName': card.cardHolderName,
      'month': card.month,
      'year': card.year,
      'cvv': card.cvv,
      'issuingCountry': jsonEncode(card.issuingCountry.toJson()),
    });
  }

  /// Retrieve all CreditCardDto from the database
  Future<List<CreditCardDto>> getCreditCards() async {
    final db = await database;
    final maps = await db.query('credit_cards');

    return maps.map((map) {
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
  }

  /// Delete a card by its cardNumber
  Future<void> deleteCreditCard(String cardNumber) async {
    final db = await database;
    await db.delete(
      'credit_cards',
      where: 'cardNumber = ?',
      whereArgs: [cardNumber],
    );
  }

  /// Check if a card already exists (duplicate check)
  Future<bool> checkDuplicateCard(CreditCardDto card) async {
    final db = await database;
    final result = await db.query(
      'credit_cards',
      where:
          'cardNumber = ? AND cardHolderName = ? AND month = ? AND year = ? AND cvv = ?',
      whereArgs: [
        card.cardNumber,
        card.cardHolderName,
        card.month,
        card.year,
        card.cvv,
      ],
    );
    return result.isNotEmpty;
  }
}
