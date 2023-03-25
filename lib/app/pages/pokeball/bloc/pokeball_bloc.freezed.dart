// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokeball_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PokeballEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<PokemonListItemEntity> pokemons)
        getCaughtPokemon,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<PokemonListItemEntity> pokemons)? getCaughtPokemon,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<PokemonListItemEntity> pokemons)? getCaughtPokemon,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PokeballEventInitial value) initial,
    required TResult Function(_PokeballEventGetCaughtPokemon value)
        getCaughtPokemon,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PokeballEventInitial value)? initial,
    TResult? Function(_PokeballEventGetCaughtPokemon value)? getCaughtPokemon,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PokeballEventInitial value)? initial,
    TResult Function(_PokeballEventGetCaughtPokemon value)? getCaughtPokemon,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokeballEventCopyWith<$Res> {
  factory $PokeballEventCopyWith(
          PokeballEvent value, $Res Function(PokeballEvent) then) =
      _$PokeballEventCopyWithImpl<$Res, PokeballEvent>;
}

/// @nodoc
class _$PokeballEventCopyWithImpl<$Res, $Val extends PokeballEvent>
    implements $PokeballEventCopyWith<$Res> {
  _$PokeballEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_PokeballEventInitialCopyWith<$Res> {
  factory _$$_PokeballEventInitialCopyWith(_$_PokeballEventInitial value,
          $Res Function(_$_PokeballEventInitial) then) =
      __$$_PokeballEventInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_PokeballEventInitialCopyWithImpl<$Res>
    extends _$PokeballEventCopyWithImpl<$Res, _$_PokeballEventInitial>
    implements _$$_PokeballEventInitialCopyWith<$Res> {
  __$$_PokeballEventInitialCopyWithImpl(_$_PokeballEventInitial _value,
      $Res Function(_$_PokeballEventInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_PokeballEventInitial implements _PokeballEventInitial {
  const _$_PokeballEventInitial();

  @override
  String toString() {
    return 'PokeballEvent.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_PokeballEventInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<PokemonListItemEntity> pokemons)
        getCaughtPokemon,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<PokemonListItemEntity> pokemons)? getCaughtPokemon,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<PokemonListItemEntity> pokemons)? getCaughtPokemon,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PokeballEventInitial value) initial,
    required TResult Function(_PokeballEventGetCaughtPokemon value)
        getCaughtPokemon,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PokeballEventInitial value)? initial,
    TResult? Function(_PokeballEventGetCaughtPokemon value)? getCaughtPokemon,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PokeballEventInitial value)? initial,
    TResult Function(_PokeballEventGetCaughtPokemon value)? getCaughtPokemon,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _PokeballEventInitial implements PokeballEvent {
  const factory _PokeballEventInitial() = _$_PokeballEventInitial;
}

/// @nodoc
abstract class _$$_PokeballEventGetCaughtPokemonCopyWith<$Res> {
  factory _$$_PokeballEventGetCaughtPokemonCopyWith(
          _$_PokeballEventGetCaughtPokemon value,
          $Res Function(_$_PokeballEventGetCaughtPokemon) then) =
      __$$_PokeballEventGetCaughtPokemonCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PokemonListItemEntity> pokemons});
}

/// @nodoc
class __$$_PokeballEventGetCaughtPokemonCopyWithImpl<$Res>
    extends _$PokeballEventCopyWithImpl<$Res, _$_PokeballEventGetCaughtPokemon>
    implements _$$_PokeballEventGetCaughtPokemonCopyWith<$Res> {
  __$$_PokeballEventGetCaughtPokemonCopyWithImpl(
      _$_PokeballEventGetCaughtPokemon _value,
      $Res Function(_$_PokeballEventGetCaughtPokemon) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemons = null,
  }) {
    return _then(_$_PokeballEventGetCaughtPokemon(
      null == pokemons
          ? _value._pokemons
          : pokemons // ignore: cast_nullable_to_non_nullable
              as List<PokemonListItemEntity>,
    ));
  }
}

/// @nodoc

class _$_PokeballEventGetCaughtPokemon
    implements _PokeballEventGetCaughtPokemon {
  const _$_PokeballEventGetCaughtPokemon(
      final List<PokemonListItemEntity> pokemons)
      : _pokemons = pokemons;

  final List<PokemonListItemEntity> _pokemons;
  @override
  List<PokemonListItemEntity> get pokemons {
    if (_pokemons is EqualUnmodifiableListView) return _pokemons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pokemons);
  }

  @override
  String toString() {
    return 'PokeballEvent.getCaughtPokemon(pokemons: $pokemons)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PokeballEventGetCaughtPokemon &&
            const DeepCollectionEquality().equals(other._pokemons, _pokemons));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_pokemons));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PokeballEventGetCaughtPokemonCopyWith<_$_PokeballEventGetCaughtPokemon>
      get copyWith => __$$_PokeballEventGetCaughtPokemonCopyWithImpl<
          _$_PokeballEventGetCaughtPokemon>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<PokemonListItemEntity> pokemons)
        getCaughtPokemon,
  }) {
    return getCaughtPokemon(pokemons);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<PokemonListItemEntity> pokemons)? getCaughtPokemon,
  }) {
    return getCaughtPokemon?.call(pokemons);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<PokemonListItemEntity> pokemons)? getCaughtPokemon,
    required TResult orElse(),
  }) {
    if (getCaughtPokemon != null) {
      return getCaughtPokemon(pokemons);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PokeballEventInitial value) initial,
    required TResult Function(_PokeballEventGetCaughtPokemon value)
        getCaughtPokemon,
  }) {
    return getCaughtPokemon(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PokeballEventInitial value)? initial,
    TResult? Function(_PokeballEventGetCaughtPokemon value)? getCaughtPokemon,
  }) {
    return getCaughtPokemon?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PokeballEventInitial value)? initial,
    TResult Function(_PokeballEventGetCaughtPokemon value)? getCaughtPokemon,
    required TResult orElse(),
  }) {
    if (getCaughtPokemon != null) {
      return getCaughtPokemon(this);
    }
    return orElse();
  }
}

abstract class _PokeballEventGetCaughtPokemon implements PokeballEvent {
  const factory _PokeballEventGetCaughtPokemon(
          final List<PokemonListItemEntity> pokemons) =
      _$_PokeballEventGetCaughtPokemon;

  List<PokemonListItemEntity> get pokemons;
  @JsonKey(ignore: true)
  _$$_PokeballEventGetCaughtPokemonCopyWith<_$_PokeballEventGetCaughtPokemon>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PokeballState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isRefreshed => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<PokemonListItemEntity> get pokemons =>
      throw _privateConstructorUsedError;
  List<Color> get dominantColors => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PokeballStateCopyWith<PokeballState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokeballStateCopyWith<$Res> {
  factory $PokeballStateCopyWith(
          PokeballState value, $Res Function(PokeballState) then) =
      _$PokeballStateCopyWithImpl<$Res, PokeballState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isRefreshed,
      String? message,
      List<PokemonListItemEntity> pokemons,
      List<Color> dominantColors});
}

/// @nodoc
class _$PokeballStateCopyWithImpl<$Res, $Val extends PokeballState>
    implements $PokeballStateCopyWith<$Res> {
  _$PokeballStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isRefreshed = null,
    Object? message = freezed,
    Object? pokemons = null,
    Object? dominantColors = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isRefreshed: null == isRefreshed
          ? _value.isRefreshed
          : isRefreshed // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      pokemons: null == pokemons
          ? _value.pokemons
          : pokemons // ignore: cast_nullable_to_non_nullable
              as List<PokemonListItemEntity>,
      dominantColors: null == dominantColors
          ? _value.dominantColors
          : dominantColors // ignore: cast_nullable_to_non_nullable
              as List<Color>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PokeballStateCopyWith<$Res>
    implements $PokeballStateCopyWith<$Res> {
  factory _$$_PokeballStateCopyWith(
          _$_PokeballState value, $Res Function(_$_PokeballState) then) =
      __$$_PokeballStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isRefreshed,
      String? message,
      List<PokemonListItemEntity> pokemons,
      List<Color> dominantColors});
}

/// @nodoc
class __$$_PokeballStateCopyWithImpl<$Res>
    extends _$PokeballStateCopyWithImpl<$Res, _$_PokeballState>
    implements _$$_PokeballStateCopyWith<$Res> {
  __$$_PokeballStateCopyWithImpl(
      _$_PokeballState _value, $Res Function(_$_PokeballState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isRefreshed = null,
    Object? message = freezed,
    Object? pokemons = null,
    Object? dominantColors = null,
  }) {
    return _then(_$_PokeballState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isRefreshed: null == isRefreshed
          ? _value.isRefreshed
          : isRefreshed // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      pokemons: null == pokemons
          ? _value._pokemons
          : pokemons // ignore: cast_nullable_to_non_nullable
              as List<PokemonListItemEntity>,
      dominantColors: null == dominantColors
          ? _value._dominantColors
          : dominantColors // ignore: cast_nullable_to_non_nullable
              as List<Color>,
    ));
  }
}

/// @nodoc

class _$_PokeballState extends _PokeballState {
  const _$_PokeballState(
      {required this.isLoading,
      required this.isRefreshed,
      required this.message,
      required final List<PokemonListItemEntity> pokemons,
      required final List<Color> dominantColors})
      : _pokemons = pokemons,
        _dominantColors = dominantColors,
        super._();

  @override
  final bool isLoading;
  @override
  final bool isRefreshed;
  @override
  final String? message;
  final List<PokemonListItemEntity> _pokemons;
  @override
  List<PokemonListItemEntity> get pokemons {
    if (_pokemons is EqualUnmodifiableListView) return _pokemons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pokemons);
  }

  final List<Color> _dominantColors;
  @override
  List<Color> get dominantColors {
    if (_dominantColors is EqualUnmodifiableListView) return _dominantColors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dominantColors);
  }

  @override
  String toString() {
    return 'PokeballState(isLoading: $isLoading, isRefreshed: $isRefreshed, message: $message, pokemons: $pokemons, dominantColors: $dominantColors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PokeballState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isRefreshed, isRefreshed) ||
                other.isRefreshed == isRefreshed) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._pokemons, _pokemons) &&
            const DeepCollectionEquality()
                .equals(other._dominantColors, _dominantColors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isRefreshed,
      message,
      const DeepCollectionEquality().hash(_pokemons),
      const DeepCollectionEquality().hash(_dominantColors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PokeballStateCopyWith<_$_PokeballState> get copyWith =>
      __$$_PokeballStateCopyWithImpl<_$_PokeballState>(this, _$identity);
}

abstract class _PokeballState extends PokeballState {
  const factory _PokeballState(
      {required final bool isLoading,
      required final bool isRefreshed,
      required final String? message,
      required final List<PokemonListItemEntity> pokemons,
      required final List<Color> dominantColors}) = _$_PokeballState;
  const _PokeballState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isRefreshed;
  @override
  String? get message;
  @override
  List<PokemonListItemEntity> get pokemons;
  @override
  List<Color> get dominantColors;
  @override
  @JsonKey(ignore: true)
  _$$_PokeballStateCopyWith<_$_PokeballState> get copyWith =>
      throw _privateConstructorUsedError;
}
