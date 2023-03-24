part of 'pokedex_detail_bloc.dart';

@freezed
class PokedexDetailState with _$PokedexDetailState {
  const PokedexDetailState._();
  const factory PokedexDetailState({
    required bool isLoading,
    required bool isRefreshed,
    required bool isAlreadyCaught,
    required bool isCatching,
    required bool isReleasing,
    required String? message,
    PokemonEntity? pokemon,
  }) = _PokedexDetailState;

  factory PokedexDetailState.initial() => const PokedexDetailState(
        isLoading: true,
        isAlreadyCaught: false,
        isCatching: false,
        isReleasing: false,
        isRefreshed: false,
        message: null,
        pokemon: null,
      );
}
