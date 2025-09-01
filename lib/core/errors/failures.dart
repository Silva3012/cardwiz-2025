abstract class Failure {
  final String message;
  Failure(this.message);
}

class CacheFailure extends Failure {
  CacheFailure(super.message);
}

class DuplicateCardFailure extends Failure {
  DuplicateCardFailure() : super("This card already exists.");
}

class CardNotFoundFailure extends Failure {
  CardNotFoundFailure() : super("Card not found.");
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
}
