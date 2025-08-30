// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_card_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreditCardDtoImpl _$$CreditCardDtoImplFromJson(Map<String, dynamic> json) =>
    _$CreditCardDtoImpl(
      cardNumber: json['cardNumber'] as String,
      cardType: json['cardType'] as String,
      cardHolderName: json['cardHolderName'] as String,
      expiryDate: json['expiryDate'] as String,
      cvv: json['cvv'] as String,
      issuingCountry: json['issuingCountry'] as String,
    );

Map<String, dynamic> _$$CreditCardDtoImplToJson(_$CreditCardDtoImpl instance) =>
    <String, dynamic>{
      'cardNumber': instance.cardNumber,
      'cardType': instance.cardType,
      'cardHolderName': instance.cardHolderName,
      'expiryDate': instance.expiryDate,
      'cvv': instance.cvv,
      'issuingCountry': instance.issuingCountry,
    };
