// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_card_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreditCardDtoImpl _$$CreditCardDtoImplFromJson(Map<String, dynamic> json) =>
    _$CreditCardDtoImpl(
      cardNumber: json['cardNumber'] as String,
      cardType: $enumDecode(_$CardTypeEnumMap, json['cardType']),
      cardHolderName: json['cardHolderName'] as String,
      month: (json['month'] as num?)?.toInt(),
      year: (json['year'] as num?)?.toInt(),
      cvv: (json['cvv'] as num?)?.toInt(),
      issuingCountry:
          CountryDto.fromJson(json['issuingCountry'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CreditCardDtoImplToJson(_$CreditCardDtoImpl instance) =>
    <String, dynamic>{
      'cardNumber': instance.cardNumber,
      'cardType': _$CardTypeEnumMap[instance.cardType]!,
      'cardHolderName': instance.cardHolderName,
      'month': instance.month,
      'year': instance.year,
      'cvv': instance.cvv,
      'issuingCountry': instance.issuingCountry,
    };

const _$CardTypeEnumMap = {
  CardType.visa: 'visa',
  CardType.maestro: 'maestro',
  CardType.mastercard: 'mastercard',
  CardType.others: 'others',
  CardType.invalid: 'invalid',
};
