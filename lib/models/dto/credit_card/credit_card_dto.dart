import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_card_dto.freezed.dart';
part 'credit_card_dto.g.dart';

@freezed
class CreditCardDto with _$CreditCardDto {
  const factory CreditCardDto({
    required String cardNumber,
    required String cardType,
    required String cardHolderName,
    required String expiryDate,
    required String cvv,
    required String issuingCountry,
  }) = _CreditCardDto;

  factory CreditCardDto.empty() => const CreditCardDto(
        cardNumber: '',
        cardType: '',
        cardHolderName: '',
        expiryDate: '',
        cvv: '',
        issuingCountry: '',
      );

  factory CreditCardDto.fromJson(Map<String, dynamic> json) =>
      _$CreditCardDtoFromJson(json);
}
