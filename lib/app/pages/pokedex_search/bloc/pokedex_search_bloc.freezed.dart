// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokedex_search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PokedexSearchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String query) searchPokemon,
    required TResult Function(String pokemonName, Color dominantColor) toDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String query)? searchPokemon,
    TResult? Function(String pokemonName, Color dominantColor)? toDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String query)? searchPokemon,
    TResult Function(String pokemonName, Color dominantColor)? toDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PokedexSearchEventStarted value) started,
    required TResult Function(_PokedexSearchEventSearchPokemon value)
        searchPokemon,
    required TResult Function(_PokedexSearchEventToDetail value) toDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PokedexSearchEventStarted value)? started,
    TResult? Function(_PokedexSearchEventSearchPokemon value)? searchPokemon,
    TResult? Function(_PokedexSearchEventToDetail value)? toDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PokedexSearchEventStarted value)? started,
    TResult Function(_PokedexSearchEventSearchPokemon value)? searchPokemon,
    TResult Function(_PokedexSearchEventToDetail value)? toDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokedexSearchEventCopyWith<$Res> {
  factory $PokedexSearchEventCopyWith(
          PokedexSearchEvent value, $Res Function(PokedexSearchEvent) then) =
      _$PokedexSearchEventCopyWithImpl<$Res, PokedexSearchEvent>;
}

/// @nodoc
class _$PokedexSearchEventCopyWithImpl<$Res, $Val extends PokedexSearchEvent>
    implements $PokedexSearchEventCopyWith<$Res> {
  _$PokedexSearchEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_PokedexSearchEventStartedCopyWith<$Res> {
  factory _$$_PokedexSearchEventStartedCopyWith(
          _$_PokedexSearchEventStarted value,
          $Res Function(_$_PokedexSearchEventStarted) then) =
      __$$_PokedexSearchEventStartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_PokedexSearchEventStartedCopyWithImpl<$Res>
    extends _$PokedexSearchEventCopyWithImpl<$Res, _$_PokedexSearchEventStarted>
    implements _$$_PokedexSearchEventStartedCopyWith<$Res> {
  __$$_PokedexSearchEventStartedCopyWithImpl(
      _$_PokedexSearchEventStarted _value,
      $Res Function(_$_PokedexSearchEventStarted) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_PokedexSearchEventStarted implements _PokedexSearchEventStarted {
  const _$_PokedexSearchEventStarted();

  @override
  String toString() {
    return 'PokedexSearchEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PokedexSearchEventStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String query) searchPokemon,
    required TResult Function(String pokemonName, Color dominantColor) toDetail,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String query)? searchPokemon,
    TResult? Function(String pokemonName, Color dominantColor)? toDetail,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String query)? searchPokemon,
    TResult Function(String pokemonName, Color dominantColor)? toDetail,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PokedexSearchEventStarted value) started,
    required TResult Function(_PokedexSearchEventSearchPokemon value)
        searchPokemon,
    required TResult Function(_PokedexSearchEventToDetail value) toDetail,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PokedexSearchEventStarted value)? started,
    TResult? Function(_PokedexSearchEventSearchPokemon value)? searchPokemon,
    TResult? Function(_PokedexSearchEventToDetail value)? toDetail,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PokedexSearchEventStarted value)? started,
    TResult Function(_PokedexSearchEventSearchPokemon value)? searchPokemon,
    TResult Function(_PokedexSearchEventToDetail value)? toDetail,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _PokedexSearchEventStarted implements PokedexSearchEvent {
  const factory _PokedexSearchEventStarted() = _$_PokedexSearchEventStarted;
}

/// @nodoc
abstract class _$$_PokedexSearchEventSearchPokemonCopyWith<$Res> {
  factory _$$_PokedexSearchEventSearchPokemonCopyWith(
          _$_PokedexSearchEventSearchPokemon value,
          $Res Function(_$_PokedexSearchEventSearchPokemon) then) =
      __$$_PokedexSearchEventSearchPokemonCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$_PokedexSearchEventSearchPokemonCopyWithImpl<$Res>
    extends _$PokedexSearchEventCopyWithImpl<$Res,
        _$_PokedexSearchEventSearchPokemon>
    implements _$$_PokedexSearchEventSearchPokemonCopyWith<$Res> {
  __$$_PokedexSearchEventSearchPokemonCopyWithImpl(
      _$_PokedexSearchEventSearchPokemon _value,
      $Res Function(_$_PokedexSearchEventSearchPokemon) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$_PokedexSearchEventSearchPokemon(
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PokedexSearchEventSearchPokemon
    implements _PokedexSearchEventSearchPokemon {
  const _$_PokedexSearchEventSearchPokemon(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'PokedexSearchEvent.searchPokemon(query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PokedexSearchEventSearchPokemon &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PokedexSearchEventSearchPokemonCopyWith<
          _$_PokedexSearchEventSearchPokemon>
      get copyWith => __$$_PokedexSearchEventSearchPokemonCopyWithImpl<
          _$_PokedexSearchEventSearchPokemon>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String query) searchPokemon,
    required TResult Function(String pokemonName, Color dominantColor) toDetail,
  }) {
    return searchPokemon(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String query)? searchPokemon,
    TResult? Function(String pokemonName, Color dominantColor)? toDetail,
  }) {
    return searchPokemon?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String query)? searchPokemon,
    TResult Function(String pokemonName, Color dominantColor)? toDetail,
    required TResult orElse(),
  }) {
    if (searchPokemon != null) {
      return searchPokemon(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PokedexSearchEventStarted value) started,
    required TResult Function(_PokedexSearchEventSearchPokemon value)
        searchPokemon,
    required TResult Function(_PokedexSearchEventToDetail value) toDetail,
  }) {
    return searchPokemon(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PokedexSearchEventStarted value)? started,
    TResult? Function(_PokedexSearchEventSearchPokemon value)? searchPokemon,
    TResult? Function(_PokedexSearchEventToDetail value)? toDetail,
  }) {
    return searchPokemon?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PokedexSearchEventStarted value)? started,
    TResult Function(_PokedexSearchEventSearchPokemon value)? searchPokemon,
    TResult Function(_PokedexSearchEventToDetail value)? toDetail,
    required TResult orElse(),
  }) {
    if (searchPokemon != null) {
      return searchPokemon(this);
    }
    return orElse();
  }
}

abstract class _PokedexSearchEventSearchPokemon implements PokedexSearchEvent {
  const factory _PokedexSearchEventSearchPokemon(final String query) =
      _$_PokedexSearchEventSearchPokemon;

  String get query;
  @JsonKey(ignore: true)
  _$$_PokedexSearchEventSearchPokemonCopyWith<
          _$_PokedexSearchEventSearchPokemon>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PokedexSearchEventToDetailCopyWith<$Res> {
  factory _$$_PokedexSearchEventToDetailCopyWith(
          _$_PokedexSearchEventToDetail value,
          $Res Function(_$_PokedexSearchEventToDetail) then) =
      __$$_PokedexSearchEventToDetailCopyWithImpl<$Res>;
  @useResult
  $Res call({String pokemonName, Color dominantColor});
}

/// @nodoc
class __$$_PokedexSearchEventToDetailCopyWithImpl<$Res>
    extends _$PokedexSearchEventCopyWithImpl<$Res,
        _$_PokedexSearchEventToDetail>
    implements _$$_PokedexSearchEventToDetailCopyWith<$Res> {
  __$$_PokedexSearchEventToDetailCopyWithImpl(
      _$_PokedexSearchEventToDetail _value,
      $Res Function(_$_PokedexSearchEventToDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemonName = null,
    Object? dominantColor = null,
  }) {
    return _then(_$_PokedexSearchEventToDetail(
      null == pokemonName
          ? _value.pokemonName
          : pokemonName // ignore: cast_nullable_to_non_nullable
              as String,
      null == dominantColor
          ? _value.dominantColor
          : dominantColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$_PokedexSearchEventToDetail implements _PokedexSearchEventToDetail {
  const _$_PokedexSearchEventToDetail(this.pokemonName, this.dominantColor);

  @override
  final String pokemonName;
  @override
  final Color dominantColor;

  @override
  String toString() {
    return 'PokedexSearchEvent.toDetail(pokemonName: $pokemonName, dominantColor: $dominantColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PokedexSearchEventToDetail &&
            (identical(other.pokemonName, pokemonName) ||
                other.pokemonName == pokemonName) &&
            (identical(other.dominantColor, dominantColor) ||
                other.dominantColor == dominantColor));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pokemonName, dominantColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PokedexSearchEventToDetailCopyWith<_$_PokedexSearchEventToDetail>
      get copyWith => __$$_PokedexSearchEventToDetailCopyWithImpl<
          _$_PokedexSearchEventToDetail>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String query) searchPokemon,
    required TResult Function(String pokemonName, Color dominantColor) toDetail,
  }) {
    return toDetail(pokemonName, dominantColor);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String query)? searchPokemon,
    TResult? Function(String pokemonName, Color dominantColor)? toDetail,
  }) {
    return toDetail?.call(pokemonName, dominantColor);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String query)? searchPokemon,
    TResult Function(String pokemonName, Color dominantColor)? toDetail,
    required TResult orElse(),
  }) {
    if (toDetail != null) {
      return toDetail(pokemonName, dominantColor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PokedexSearchEventStarted value) started,
    required TResult Function(_PokedexSearchEventSearchPokemon value)
        searchPokemon,
    required TResult Function(_PokedexSearchEventToDetail value) toDetail,
  }) {
    return toDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PokedexSearchEventStarted value)? started,
    TResult? Function(_PokedexSearchEventSearchPokemon value)? searchPokemon,
    TResult? Function(_PokedexSearchEventToDetail value)? toDetail,
  }) {
    return toDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PokedexSearchEventStarted value)? started,
    TResult Function(_PokedexSearchEventSearchPokemon value)? searchPokemon,
    TResult Function(_PokedexSearchEventToDetail value)? toDetail,
    required TResult orElse(),
  }) {
    if (toDetail != null) {
      return toDetail(this);
    }
    return orElse();
  }
}

abstract class _PokedexSearchEventToDetail implements PokedexSearchEvent {
  const factory _PokedexSearchEventToDetail(
          final String pokemonName, final Color dominantColor) =
      _$_PokedexSearchEventToDetail;

  String get pokemonName;
  Color get dominantColor;
  @JsonKey(ignore: true)
  _$$_PokedexSearchEventToDetailCopyWith<_$_PokedexSearchEventToDetail>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PokedexSearchState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isRefreshed => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<PokemonListItemEntity> get queryResult =>
      throw _privateConstructorUsedError;
  List<PokemonListItemEntity> get pokemonsList =>
      throw _privateConstructorUsedError;
  List<Color> get dominantColorsData => throw _privateConstructorUsedError;
  bool get goToDetail => throw _privateConstructorUsedError;
  String? get pokemonName => throw _privateConstructorUsedError;
  Color? get dominantColor => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PokedexSearchStateCopyWith<PokedexSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokedexSearchStateCopyWith<$Res> {
  factory $PokedexSearchStateCopyWith(
          PokedexSearchState value, $Res Function(PokedexSearchState) then) =
      _$PokedexSearchStateCopyWithImpl<$Res, PokedexSearchState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isRefreshed,
      String? message,
      List<PokemonListItemEntity> queryResult,
      List<PokemonListItemEntity> pokemonsList,
      List<Color> dominantColorsData,
      bool goToDetail,
      String? pokemonName,
      Color? dominantColor});
}

/// @nodoc
class _$PokedexSearchStateCopyWithImpl<$Res, $Val extends PokedexSearchState>
    implements $PokedexSearchStateCopyWith<$Res> {
  _$PokedexSearchStateCopyWithImpl(this._value, this._then);

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
    Object? queryResult = null,
    Object? pokemonsList = null,
    Object? dominantColorsData = null,
    Object? goToDetail = null,
    Object? pokemonName = freezed,
    Object? dominantColor = freezed,
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
      queryResult: null == queryResult
          ? _value.queryResult
          : queryResult // ignore: cast_nullable_to_non_nullable
              as List<PokemonListItemEntity>,
      pokemonsList: null == pokemonsList
          ? _value.pokemonsList
          : pokemonsList // ignore: cast_nullable_to_non_nullable
              as List<PokemonListItemEntity>,
      dominantColorsData: null == dominantColorsData
          ? _value.dominantColorsData
          : dominantColorsData // ignore: cast_nullable_to_non_nullable
              as List<Color>,
      goToDetail: null == goToDetail
          ? _value.goToDetail
          : goToDetail // ignore: cast_nullable_to_non_nullable
              as bool,
      pokemonName: freezed == pokemonName
          ? _value.pokemonName
          : pokemonName // ignore: cast_nullable_to_non_nullable
              as String?,
      dominantColor: freezed == dominantColor
          ? _value.dominantColor
          : dominantColor // ignore: cast_nullable_to_non_nullable
              as Color?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PokedexSearchStateCopyWith<$Res>
    implements $PokedexSearchStateCopyWith<$Res> {
  factory _$$_PokedexSearchStateCopyWith(_$_PokedexSearchState value,
          $Res Function(_$_PokedexSearchState) then) =
      __$$_PokedexSearchStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isRefreshed,
      String? message,
      List<PokemonListItemEntity> queryResult,
      List<PokemonListItemEntity> pokemonsList,
      List<Color> dominantColorsData,
      bool goToDetail,
      String? pokemonName,
      Color? dominantColor});
}

/// @nodoc
class __$$_PokedexSearchStateCopyWithImpl<$Res>
    extends _$PokedexSearchStateCopyWithImpl<$Res, _$_PokedexSearchState>
    implements _$$_PokedexSearchStateCopyWith<$Res> {
  __$$_PokedexSearchStateCopyWithImpl(
      _$_PokedexSearchState _value, $Res Function(_$_PokedexSearchState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isRefreshed = null,
    Object? message = freezed,
    Object? queryResult = null,
    Object? pokemonsList = null,
    Object? dominantColorsData = null,
    Object? goToDetail = null,
    Object? pokemonName = freezed,
    Object? dominantColor = freezed,
  }) {
    return _then(_$_PokedexSearchState(
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
      queryResult: null == queryResult
          ? _value._queryResult
          : queryResult // ignore: cast_nullable_to_non_nullable
              as List<PokemonListItemEntity>,
      pokemonsList: null == pokemonsList
          ? _value._pokemonsList
          : pokemonsList // ignore: cast_nullable_to_non_nullable
              as List<PokemonListItemEntity>,
      dominantColorsData: null == dominantColorsData
          ? _value._dominantColorsData
          : dominantColorsData // ignore: cast_nullable_to_non_nullable
              as List<Color>,
      goToDetail: null == goToDetail
          ? _value.goToDetail
          : goToDetail // ignore: cast_nullable_to_non_nullable
              as bool,
      pokemonName: freezed == pokemonName
          ? _value.pokemonName
          : pokemonName // ignore: cast_nullable_to_non_nullable
              as String?,
      dominantColor: freezed == dominantColor
          ? _value.dominantColor
          : dominantColor // ignore: cast_nullable_to_non_nullable
              as Color?,
    ));
  }
}

/// @nodoc

class _$_PokedexSearchState extends _PokedexSearchState {
  const _$_PokedexSearchState(
      {required this.isLoading,
      required this.isRefreshed,
      required this.message,
      required final List<PokemonListItemEntity> queryResult,
      required final List<PokemonListItemEntity> pokemonsList,
      required final List<Color> dominantColorsData,
      required this.goToDetail,
      required this.pokemonName,
      required this.dominantColor})
      : _queryResult = queryResult,
        _pokemonsList = pokemonsList,
        _dominantColorsData = dominantColorsData,
        super._();

  @override
  final bool isLoading;
  @override
  final bool isRefreshed;
  @override
  final String? message;
  final List<PokemonListItemEntity> _queryResult;
  @override
  List<PokemonListItemEntity> get queryResult {
    if (_queryResult is EqualUnmodifiableListView) return _queryResult;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_queryResult);
  }

  final List<PokemonListItemEntity> _pokemonsList;
  @override
  List<PokemonListItemEntity> get pokemonsList {
    if (_pokemonsList is EqualUnmodifiableListView) return _pokemonsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pokemonsList);
  }

  final List<Color> _dominantColorsData;
  @override
  List<Color> get dominantColorsData {
    if (_dominantColorsData is EqualUnmodifiableListView)
      return _dominantColorsData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dominantColorsData);
  }

  @override
  final bool goToDetail;
  @override
  final String? pokemonName;
  @override
  final Color? dominantColor;

  @override
  String toString() {
    return 'PokedexSearchState(isLoading: $isLoading, isRefreshed: $isRefreshed, message: $message, queryResult: $queryResult, pokemonsList: $pokemonsList, dominantColorsData: $dominantColorsData, goToDetail: $goToDetail, pokemonName: $pokemonName, dominantColor: $dominantColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PokedexSearchState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isRefreshed, isRefreshed) ||
                other.isRefreshed == isRefreshed) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._queryResult, _queryResult) &&
            const DeepCollectionEquality()
                .equals(other._pokemonsList, _pokemonsList) &&
            const DeepCollectionEquality()
                .equals(other._dominantColorsData, _dominantColorsData) &&
            (identical(other.goToDetail, goToDetail) ||
                other.goToDetail == goToDetail) &&
            (identical(other.pokemonName, pokemonName) ||
                other.pokemonName == pokemonName) &&
            (identical(other.dominantColor, dominantColor) ||
                other.dominantColor == dominantColor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isRefreshed,
      message,
      const DeepCollectionEquality().hash(_queryResult),
      const DeepCollectionEquality().hash(_pokemonsList),
      const DeepCollectionEquality().hash(_dominantColorsData),
      goToDetail,
      pokemonName,
      dominantColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PokedexSearchStateCopyWith<_$_PokedexSearchState> get copyWith =>
      __$$_PokedexSearchStateCopyWithImpl<_$_PokedexSearchState>(
          this, _$identity);
}

abstract class _PokedexSearchState extends PokedexSearchState {
  const factory _PokedexSearchState(
      {required final bool isLoading,
      required final bool isRefreshed,
      required final String? message,
      required final List<PokemonListItemEntity> queryResult,
      required final List<PokemonListItemEntity> pokemonsList,
      required final List<Color> dominantColorsData,
      required final bool goToDetail,
      required final String? pokemonName,
      required final Color? dominantColor}) = _$_PokedexSearchState;
  const _PokedexSearchState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isRefreshed;
  @override
  String? get message;
  @override
  List<PokemonListItemEntity> get queryResult;
  @override
  List<PokemonListItemEntity> get pokemonsList;
  @override
  List<Color> get dominantColorsData;
  @override
  bool get goToDetail;
  @override
  String? get pokemonName;
  @override
  Color? get dominantColor;
  @override
  @JsonKey(ignore: true)
  _$$_PokedexSearchStateCopyWith<_$_PokedexSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
