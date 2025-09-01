part of 'credit_card_bloc.dart';

@freezed
class CreditCardEvent with _$CreditCardEvent {
  const factory CreditCardEvent.onGetCards() = OnGetCards;
  const factory CreditCardEvent.onAddCard({required CreditCardDto card}) =
      OnAddCard;
  const factory CreditCardEvent.onDeleteCard({required String cardNumber}) =
      OnDeleteCard;
  const factory CreditCardEvent.onGetCountries() = OnGetCountries;
}
