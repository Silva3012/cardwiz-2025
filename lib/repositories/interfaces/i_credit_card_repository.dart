import 'package:cardwiz/core/errors/failures.dart';
import 'package:cardwiz/models/dto/credit_card/credit_card_dto.dart';
import 'package:dartz/dartz.dart';

abstract class ICreditCardRepository {
  Future<Either<Failure, void>> addCard(CreditCardDto card);
  Future<Either<Failure, List<CreditCardDto>>> getCards();
  Future<Either<Failure, void>> deleteCard(String cardNumber);
}
