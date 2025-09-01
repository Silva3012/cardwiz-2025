import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_dto.freezed.dart';
part 'country_dto.g.dart';

@freezed
class CountryDto with _$CountryDto {
  const factory CountryDto({
    required String name,
    required String code,
  }) = _CountryDto;

  factory CountryDto.empty() => const CountryDto(
        name: '',
        code: '',
      );

  factory CountryDto.fromJson(Map<String, dynamic> json) =>
      _$CountryDtoFromJson(json);

  @override
  String toString() => "Country: $name";
}
