// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credit_card_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreditCardDto _$CreditCardDtoFromJson(Map<String, dynamic> json) {
  return _CreditCardDto.fromJson(json);
}

/// @nodoc
mixin _$CreditCardDto {
  String get cardNumber => throw _privateConstructorUsedError;
  CardType get cardType => throw _privateConstructorUsedError;
  String get cardHolderName => throw _privateConstructorUsedError;
  int? get month => throw _privateConstructorUsedError;
  int? get year => throw _privateConstructorUsedError;
  int? get cvv => throw _privateConstructorUsedError;
  CountryDto get issuingCountry => throw _privateConstructorUsedError;

  /// Serializes this CreditCardDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreditCardDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreditCardDtoCopyWith<CreditCardDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditCardDtoCopyWith<$Res> {
  factory $CreditCardDtoCopyWith(
          CreditCardDto value, $Res Function(CreditCardDto) then) =
      _$CreditCardDtoCopyWithImpl<$Res, CreditCardDto>;
  @useResult
  $Res call(
      {String cardNumber,
      CardType cardType,
      String cardHolderName,
      int? month,
      int? year,
      int? cvv,
      CountryDto issuingCountry});

  $CountryDtoCopyWith<$Res> get issuingCountry;
}

/// @nodoc
class _$CreditCardDtoCopyWithImpl<$Res, $Val extends CreditCardDto>
    implements $CreditCardDtoCopyWith<$Res> {
  _$CreditCardDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreditCardDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardNumber = null,
    Object? cardType = null,
    Object? cardHolderName = null,
    Object? month = freezed,
    Object? year = freezed,
    Object? cvv = freezed,
    Object? issuingCountry = null,
  }) {
    return _then(_value.copyWith(
      cardNumber: null == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String,
      cardType: null == cardType
          ? _value.cardType
          : cardType // ignore: cast_nullable_to_non_nullable
              as CardType,
      cardHolderName: null == cardHolderName
          ? _value.cardHolderName
          : cardHolderName // ignore: cast_nullable_to_non_nullable
              as String,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      cvv: freezed == cvv
          ? _value.cvv
          : cvv // ignore: cast_nullable_to_non_nullable
              as int?,
      issuingCountry: null == issuingCountry
          ? _value.issuingCountry
          : issuingCountry // ignore: cast_nullable_to_non_nullable
              as CountryDto,
    ) as $Val);
  }

  /// Create a copy of CreditCardDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CountryDtoCopyWith<$Res> get issuingCountry {
    return $CountryDtoCopyWith<$Res>(_value.issuingCountry, (value) {
      return _then(_value.copyWith(issuingCountry: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreditCardDtoImplCopyWith<$Res>
    implements $CreditCardDtoCopyWith<$Res> {
  factory _$$CreditCardDtoImplCopyWith(
          _$CreditCardDtoImpl value, $Res Function(_$CreditCardDtoImpl) then) =
      __$$CreditCardDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String cardNumber,
      CardType cardType,
      String cardHolderName,
      int? month,
      int? year,
      int? cvv,
      CountryDto issuingCountry});

  @override
  $CountryDtoCopyWith<$Res> get issuingCountry;
}

/// @nodoc
class __$$CreditCardDtoImplCopyWithImpl<$Res>
    extends _$CreditCardDtoCopyWithImpl<$Res, _$CreditCardDtoImpl>
    implements _$$CreditCardDtoImplCopyWith<$Res> {
  __$$CreditCardDtoImplCopyWithImpl(
      _$CreditCardDtoImpl _value, $Res Function(_$CreditCardDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreditCardDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardNumber = null,
    Object? cardType = null,
    Object? cardHolderName = null,
    Object? month = freezed,
    Object? year = freezed,
    Object? cvv = freezed,
    Object? issuingCountry = null,
  }) {
    return _then(_$CreditCardDtoImpl(
      cardNumber: null == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String,
      cardType: null == cardType
          ? _value.cardType
          : cardType // ignore: cast_nullable_to_non_nullable
              as CardType,
      cardHolderName: null == cardHolderName
          ? _value.cardHolderName
          : cardHolderName // ignore: cast_nullable_to_non_nullable
              as String,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      cvv: freezed == cvv
          ? _value.cvv
          : cvv // ignore: cast_nullable_to_non_nullable
              as int?,
      issuingCountry: null == issuingCountry
          ? _value.issuingCountry
          : issuingCountry // ignore: cast_nullable_to_non_nullable
              as CountryDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreditCardDtoImpl implements _CreditCardDto {
  const _$CreditCardDtoImpl(
      {required this.cardNumber,
      required this.cardType,
      required this.cardHolderName,
      required this.month,
      required this.year,
      required this.cvv,
      required this.issuingCountry});

  factory _$CreditCardDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreditCardDtoImplFromJson(json);

  @override
  final String cardNumber;
  @override
  final CardType cardType;
  @override
  final String cardHolderName;
  @override
  final int? month;
  @override
  final int? year;
  @override
  final int? cvv;
  @override
  final CountryDto issuingCountry;

  @override
  String toString() {
    return 'CreditCardDto(cardNumber: $cardNumber, cardType: $cardType, cardHolderName: $cardHolderName, month: $month, year: $year, cvv: $cvv, issuingCountry: $issuingCountry)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreditCardDtoImpl &&
            (identical(other.cardNumber, cardNumber) ||
                other.cardNumber == cardNumber) &&
            (identical(other.cardType, cardType) ||
                other.cardType == cardType) &&
            (identical(other.cardHolderName, cardHolderName) ||
                other.cardHolderName == cardHolderName) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.cvv, cvv) || other.cvv == cvv) &&
            (identical(other.issuingCountry, issuingCountry) ||
                other.issuingCountry == issuingCountry));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cardNumber, cardType,
      cardHolderName, month, year, cvv, issuingCountry);

  /// Create a copy of CreditCardDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreditCardDtoImplCopyWith<_$CreditCardDtoImpl> get copyWith =>
      __$$CreditCardDtoImplCopyWithImpl<_$CreditCardDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreditCardDtoImplToJson(
      this,
    );
  }
}

abstract class _CreditCardDto implements CreditCardDto {
  const factory _CreditCardDto(
      {required final String cardNumber,
      required final CardType cardType,
      required final String cardHolderName,
      required final int? month,
      required final int? year,
      required final int? cvv,
      required final CountryDto issuingCountry}) = _$CreditCardDtoImpl;

  factory _CreditCardDto.fromJson(Map<String, dynamic> json) =
      _$CreditCardDtoImpl.fromJson;

  @override
  String get cardNumber;
  @override
  CardType get cardType;
  @override
  String get cardHolderName;
  @override
  int? get month;
  @override
  int? get year;
  @override
  int? get cvv;
  @override
  CountryDto get issuingCountry;

  /// Create a copy of CreditCardDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreditCardDtoImplCopyWith<_$CreditCardDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
