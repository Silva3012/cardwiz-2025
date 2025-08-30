// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CountryDtoImpl _$$CountryDtoImplFromJson(Map<String, dynamic> json) =>
    _$CountryDtoImpl(
      name: json['name'] as String,
      code: json['code'] as String,
      flagUrl: json['flagUrl'] as String,
    );

Map<String, dynamic> _$$CountryDtoImplToJson(_$CountryDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'flagUrl': instance.flagUrl,
    };
