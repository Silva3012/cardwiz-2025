part of 'credit_card_bloc.dart';

@freezed
class CreditCardState with _$CreditCardState {
  factory CreditCardState({
    required List<CreditCardDto> cards,
    required List<CountryDto> countries,
    required bool isLoading,
    Failure? failure,
  }) = _CreditCardState;

  factory CreditCardState.initial() => CreditCardState(
        cards: [],
        countries: [],
        isLoading: false,
        failure: null,
      );
}
