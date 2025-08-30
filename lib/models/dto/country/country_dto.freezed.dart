// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CountryDto _$CountryDtoFromJson(Map<String, dynamic> json) {
  return _CountryDto.fromJson(json);
}

/// @nodoc
mixin _$CountryDto {
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get flagUrl => throw _privateConstructorUsedError;

  /// Serializes this CountryDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CountryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CountryDtoCopyWith<CountryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryDtoCopyWith<$Res> {
  factory $CountryDtoCopyWith(
          CountryDto value, $Res Function(CountryDto) then) =
      _$CountryDtoCopyWithImpl<$Res, CountryDto>;
  @useResult
  $Res call({String name, String code, String flagUrl});
}

/// @nodoc
class _$CountryDtoCopyWithImpl<$Res, $Val extends CountryDto>
    implements $CountryDtoCopyWith<$Res> {
  _$CountryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CountryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
    Object? flagUrl = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      flagUrl: null == flagUrl
          ? _value.flagUrl
          : flagUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CountryDtoImplCopyWith<$Res>
    implements $CountryDtoCopyWith<$Res> {
  factory _$$CountryDtoImplCopyWith(
          _$CountryDtoImpl value, $Res Function(_$CountryDtoImpl) then) =
      __$$CountryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String code, String flagUrl});
}

/// @nodoc
class __$$CountryDtoImplCopyWithImpl<$Res>
    extends _$CountryDtoCopyWithImpl<$Res, _$CountryDtoImpl>
    implements _$$CountryDtoImplCopyWith<$Res> {
  __$$CountryDtoImplCopyWithImpl(
      _$CountryDtoImpl _value, $Res Function(_$CountryDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CountryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
    Object? flagUrl = null,
  }) {
    return _then(_$CountryDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      flagUrl: null == flagUrl
          ? _value.flagUrl
          : flagUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CountryDtoImpl implements _CountryDto {
  const _$CountryDtoImpl(
      {required this.name, required this.code, required this.flagUrl});

  factory _$CountryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountryDtoImplFromJson(json);

  @override
  final String name;
  @override
  final String code;
  @override
  final String flagUrl;

  @override
  String toString() {
    return 'CountryDto(name: $name, code: $code, flagUrl: $flagUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountryDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.flagUrl, flagUrl) || other.flagUrl == flagUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, code, flagUrl);

  /// Create a copy of CountryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryDtoImplCopyWith<_$CountryDtoImpl> get copyWith =>
      __$$CountryDtoImplCopyWithImpl<_$CountryDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CountryDtoImplToJson(
      this,
    );
  }
}

abstract class _CountryDto implements CountryDto {
  const factory _CountryDto(
      {required final String name,
      required final String code,
      required final String flagUrl}) = _$CountryDtoImpl;

  factory _CountryDto.fromJson(Map<String, dynamic> json) =
      _$CountryDtoImpl.fromJson;

  @override
  String get name;
  @override
  String get code;
  @override
  String get flagUrl;

  /// Create a copy of CountryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CountryDtoImplCopyWith<_$CountryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
