part of 'pokeball_bloc.dart';

@freezed
class PokeballState with _$PokeballState {
  const PokeballState._();
  const factory PokeballState({
    required bool isLoading,
    required bool isRefreshed,
    required String? message,
    required List<PokemonListItemEntity> pokemons,
    required List<Color> dominantColors,
  }) = _PokeballState;

  factory PokeballState.initial() => const PokeballState(
        isLoading: true,
        isRefreshed: false,
        message: null,
        pokemons: [],
        dominantColors: [],
      );
}
