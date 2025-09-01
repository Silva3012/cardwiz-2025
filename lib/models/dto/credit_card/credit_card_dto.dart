import 'package:cardwiz/core/utils/card_type_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_card_dto.freezed.dart';
part 'credit_card_dto.g.dart';

@freezed
class CreditCardDto with _$CreditCardDto {
  const factory CreditCardDto({
    required String cardNumber,
    required CardType cardType,
    required String cardHolderName,
    required int? month,
    required int? year,
    required int? cvv,
    required String issuingCountry,
  }) = _CreditCardDto;

  factory CreditCardDto.empty() => const CreditCardDto(
        cardNumber: '',
        cardType: CardType.invalid,
        cardHolderName: '',
        month: null,
        year: null,
        cvv: null,
        issuingCountry: '',
      );

  factory CreditCardDto.fromJson(Map<String, dynamic> json) =>
      _$CreditCardDtoFromJson(json);
}
