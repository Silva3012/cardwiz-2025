// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credit_card_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreditCardEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onGetCards,
    required TResult Function(CreditCardDto card) onAddCard,
    required TResult Function(String cardNumber) onDeleteCard,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onGetCards,
    TResult? Function(CreditCardDto card)? onAddCard,
    TResult? Function(String cardNumber)? onDeleteCard,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onGetCards,
    TResult Function(CreditCardDto card)? onAddCard,
    TResult Function(String cardNumber)? onDeleteCard,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnGetCards value) onGetCards,
    required TResult Function(OnAddCard value) onAddCard,
    required TResult Function(OnDeleteCard value) onDeleteCard,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnGetCards value)? onGetCards,
    TResult? Function(OnAddCard value)? onAddCard,
    TResult? Function(OnDeleteCard value)? onDeleteCard,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnGetCards value)? onGetCards,
    TResult Function(OnAddCard value)? onAddCard,
    TResult Function(OnDeleteCard value)? onDeleteCard,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditCardEventCopyWith<$Res> {
  factory $CreditCardEventCopyWith(
          CreditCardEvent value, $Res Function(CreditCardEvent) then) =
      _$CreditCardEventCopyWithImpl<$Res, CreditCardEvent>;
}

/// @nodoc
class _$CreditCardEventCopyWithImpl<$Res, $Val extends CreditCardEvent>
    implements $CreditCardEventCopyWith<$Res> {
  _$CreditCardEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreditCardEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$OnGetCardsImplCopyWith<$Res> {
  factory _$$OnGetCardsImplCopyWith(
          _$OnGetCardsImpl value, $Res Function(_$OnGetCardsImpl) then) =
      __$$OnGetCardsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnGetCardsImplCopyWithImpl<$Res>
    extends _$CreditCardEventCopyWithImpl<$Res, _$OnGetCardsImpl>
    implements _$$OnGetCardsImplCopyWith<$Res> {
  __$$OnGetCardsImplCopyWithImpl(
      _$OnGetCardsImpl _value, $Res Function(_$OnGetCardsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreditCardEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OnGetCardsImpl implements OnGetCards {
  const _$OnGetCardsImpl();

  @override
  String toString() {
    return 'CreditCardEvent.onGetCards()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnGetCardsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onGetCards,
    required TResult Function(CreditCardDto card) onAddCard,
    required TResult Function(String cardNumber) onDeleteCard,
  }) {
    return onGetCards();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onGetCards,
    TResult? Function(CreditCardDto card)? onAddCard,
    TResult? Function(String cardNumber)? onDeleteCard,
  }) {
    return onGetCards?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onGetCards,
    TResult Function(CreditCardDto card)? onAddCard,
    TResult Function(String cardNumber)? onDeleteCard,
    required TResult orElse(),
  }) {
    if (onGetCards != null) {
      return onGetCards();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnGetCards value) onGetCards,
    required TResult Function(OnAddCard value) onAddCard,
    required TResult Function(OnDeleteCard value) onDeleteCard,
  }) {
    return onGetCards(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnGetCards value)? onGetCards,
    TResult? Function(OnAddCard value)? onAddCard,
    TResult? Function(OnDeleteCard value)? onDeleteCard,
  }) {
    return onGetCards?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnGetCards value)? onGetCards,
    TResult Function(OnAddCard value)? onAddCard,
    TResult Function(OnDeleteCard value)? onDeleteCard,
    required TResult orElse(),
  }) {
    if (onGetCards != null) {
      return onGetCards(this);
    }
    return orElse();
  }
}

abstract class OnGetCards implements CreditCardEvent {
  const factory OnGetCards() = _$OnGetCardsImpl;
}

/// @nodoc
abstract class _$$OnAddCardImplCopyWith<$Res> {
  factory _$$OnAddCardImplCopyWith(
          _$OnAddCardImpl value, $Res Function(_$OnAddCardImpl) then) =
      __$$OnAddCardImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CreditCardDto card});

  $CreditCardDtoCopyWith<$Res> get card;
}

/// @nodoc
class __$$OnAddCardImplCopyWithImpl<$Res>
    extends _$CreditCardEventCopyWithImpl<$Res, _$OnAddCardImpl>
    implements _$$OnAddCardImplCopyWith<$Res> {
  __$$OnAddCardImplCopyWithImpl(
      _$OnAddCardImpl _value, $Res Function(_$OnAddCardImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreditCardEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? card = null,
  }) {
    return _then(_$OnAddCardImpl(
      card: null == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as CreditCardDto,
    ));
  }

  /// Create a copy of CreditCardEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CreditCardDtoCopyWith<$Res> get card {
    return $CreditCardDtoCopyWith<$Res>(_value.card, (value) {
      return _then(_value.copyWith(card: value));
    });
  }
}

/// @nodoc

class _$OnAddCardImpl implements OnAddCard {
  const _$OnAddCardImpl({required this.card});

  @override
  final CreditCardDto card;

  @override
  String toString() {
    return 'CreditCardEvent.onAddCard(card: $card)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnAddCardImpl &&
            (identical(other.card, card) || other.card == card));
  }

  @override
  int get hashCode => Object.hash(runtimeType, card);

  /// Create a copy of CreditCardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnAddCardImplCopyWith<_$OnAddCardImpl> get copyWith =>
      __$$OnAddCardImplCopyWithImpl<_$OnAddCardImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onGetCards,
    required TResult Function(CreditCardDto card) onAddCard,
    required TResult Function(String cardNumber) onDeleteCard,
  }) {
    return onAddCard(card);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onGetCards,
    TResult? Function(CreditCardDto card)? onAddCard,
    TResult? Function(String cardNumber)? onDeleteCard,
  }) {
    return onAddCard?.call(card);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onGetCards,
    TResult Function(CreditCardDto card)? onAddCard,
    TResult Function(String cardNumber)? onDeleteCard,
    required TResult orElse(),
  }) {
    if (onAddCard != null) {
      return onAddCard(card);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnGetCards value) onGetCards,
    required TResult Function(OnAddCard value) onAddCard,
    required TResult Function(OnDeleteCard value) onDeleteCard,
  }) {
    return onAddCard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnGetCards value)? onGetCards,
    TResult? Function(OnAddCard value)? onAddCard,
    TResult? Function(OnDeleteCard value)? onDeleteCard,
  }) {
    return onAddCard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnGetCards value)? onGetCards,
    TResult Function(OnAddCard value)? onAddCard,
    TResult Function(OnDeleteCard value)? onDeleteCard,
    required TResult orElse(),
  }) {
    if (onAddCard != null) {
      return onAddCard(this);
    }
    return orElse();
  }
}

abstract class OnAddCard implements CreditCardEvent {
  const factory OnAddCard({required final CreditCardDto card}) =
      _$OnAddCardImpl;

  CreditCardDto get card;

  /// Create a copy of CreditCardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnAddCardImplCopyWith<_$OnAddCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnDeleteCardImplCopyWith<$Res> {
  factory _$$OnDeleteCardImplCopyWith(
          _$OnDeleteCardImpl value, $Res Function(_$OnDeleteCardImpl) then) =
      __$$OnDeleteCardImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String cardNumber});
}

/// @nodoc
class __$$OnDeleteCardImplCopyWithImpl<$Res>
    extends _$CreditCardEventCopyWithImpl<$Res, _$OnDeleteCardImpl>
    implements _$$OnDeleteCardImplCopyWith<$Res> {
  __$$OnDeleteCardImplCopyWithImpl(
      _$OnDeleteCardImpl _value, $Res Function(_$OnDeleteCardImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreditCardEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardNumber = null,
  }) {
    return _then(_$OnDeleteCardImpl(
      cardNumber: null == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnDeleteCardImpl implements OnDeleteCard {
  const _$OnDeleteCardImpl({required this.cardNumber});

  @override
  final String cardNumber;

  @override
  String toString() {
    return 'CreditCardEvent.onDeleteCard(cardNumber: $cardNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnDeleteCardImpl &&
            (identical(other.cardNumber, cardNumber) ||
                other.cardNumber == cardNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cardNumber);

  /// Create a copy of CreditCardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnDeleteCardImplCopyWith<_$OnDeleteCardImpl> get copyWith =>
      __$$OnDeleteCardImplCopyWithImpl<_$OnDeleteCardImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onGetCards,
    required TResult Function(CreditCardDto card) onAddCard,
    required TResult Function(String cardNumber) onDeleteCard,
  }) {
    return onDeleteCard(cardNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onGetCards,
    TResult? Function(CreditCardDto card)? onAddCard,
    TResult? Function(String cardNumber)? onDeleteCard,
  }) {
    return onDeleteCard?.call(cardNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onGetCards,
    TResult Function(CreditCardDto card)? onAddCard,
    TResult Function(String cardNumber)? onDeleteCard,
    required TResult orElse(),
  }) {
    if (onDeleteCard != null) {
      return onDeleteCard(cardNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnGetCards value) onGetCards,
    required TResult Function(OnAddCard value) onAddCard,
    required TResult Function(OnDeleteCard value) onDeleteCard,
  }) {
    return onDeleteCard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnGetCards value)? onGetCards,
    TResult? Function(OnAddCard value)? onAddCard,
    TResult? Function(OnDeleteCard value)? onDeleteCard,
  }) {
    return onDeleteCard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnGetCards value)? onGetCards,
    TResult Function(OnAddCard value)? onAddCard,
    TResult Function(OnDeleteCard value)? onDeleteCard,
    required TResult orElse(),
  }) {
    if (onDeleteCard != null) {
      return onDeleteCard(this);
    }
    return orElse();
  }
}

abstract class OnDeleteCard implements CreditCardEvent {
  const factory OnDeleteCard({required final String cardNumber}) =
      _$OnDeleteCardImpl;

  String get cardNumber;

  /// Create a copy of CreditCardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnDeleteCardImplCopyWith<_$OnDeleteCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CreditCardState {
  List<CreditCardDto> get cards => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;

  /// Create a copy of CreditCardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreditCardStateCopyWith<CreditCardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditCardStateCopyWith<$Res> {
  factory $CreditCardStateCopyWith(
          CreditCardState value, $Res Function(CreditCardState) then) =
      _$CreditCardStateCopyWithImpl<$Res, CreditCardState>;
  @useResult
  $Res call({List<CreditCardDto> cards, bool isLoading, Failure? failure});
}

/// @nodoc
class _$CreditCardStateCopyWithImpl<$Res, $Val extends CreditCardState>
    implements $CreditCardStateCopyWith<$Res> {
  _$CreditCardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreditCardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cards = null,
    Object? isLoading = null,
    Object? failure = freezed,
  }) {
    return _then(_value.copyWith(
      cards: null == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<CreditCardDto>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreditCardStateImplCopyWith<$Res>
    implements $CreditCardStateCopyWith<$Res> {
  factory _$$CreditCardStateImplCopyWith(_$CreditCardStateImpl value,
          $Res Function(_$CreditCardStateImpl) then) =
      __$$CreditCardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CreditCardDto> cards, bool isLoading, Failure? failure});
}

/// @nodoc
class __$$CreditCardStateImplCopyWithImpl<$Res>
    extends _$CreditCardStateCopyWithImpl<$Res, _$CreditCardStateImpl>
    implements _$$CreditCardStateImplCopyWith<$Res> {
  __$$CreditCardStateImplCopyWithImpl(
      _$CreditCardStateImpl _value, $Res Function(_$CreditCardStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreditCardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cards = null,
    Object? isLoading = null,
    Object? failure = freezed,
  }) {
    return _then(_$CreditCardStateImpl(
      cards: null == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<CreditCardDto>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$CreditCardStateImpl implements _CreditCardState {
  _$CreditCardStateImpl(
      {required final List<CreditCardDto> cards,
      required this.isLoading,
      this.failure})
      : _cards = cards;

  final List<CreditCardDto> _cards;
  @override
  List<CreditCardDto> get cards {
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cards);
  }

  @override
  final bool isLoading;
  @override
  final Failure? failure;

  @override
  String toString() {
    return 'CreditCardState(cards: $cards, isLoading: $isLoading, failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreditCardStateImpl &&
            const DeepCollectionEquality().equals(other._cards, _cards) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_cards), isLoading, failure);

  /// Create a copy of CreditCardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreditCardStateImplCopyWith<_$CreditCardStateImpl> get copyWith =>
      __$$CreditCardStateImplCopyWithImpl<_$CreditCardStateImpl>(
          this, _$identity);
}

abstract class _CreditCardState implements CreditCardState {
  factory _CreditCardState(
      {required final List<CreditCardDto> cards,
      required final bool isLoading,
      final Failure? failure}) = _$CreditCardStateImpl;

  @override
  List<CreditCardDto> get cards;
  @override
  bool get isLoading;
  @override
  Failure? get failure;

  /// Create a copy of CreditCardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreditCardStateImplCopyWith<_$CreditCardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
