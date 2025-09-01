part of 'credit_card_bloc.dart';

@freezed
class CreditCardState with _$CreditCardState {
  factory CreditCardState({
    required List<CreditCardDto> cards,
    required List<CountryDto> countries,
    required bool isLoading,
    bool? isCardAdded,
    Failure? failure,
  }) = _CreditCardState;

  factory CreditCardState.initial() => CreditCardState(
        cards: [],
        countries: [],
        isLoading: false,
        failure: null,
        isCardAdded: null,
      );
}
