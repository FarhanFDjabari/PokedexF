part of 'pokedex_search_bloc.dart';

@freezed
class PokedexSearchState with _$PokedexSearchState {
  const PokedexSearchState._();
  const factory PokedexSearchState({
    required bool isLoading,
    required bool isRefreshed,
    required String? message,
    required List<PokemonListItemEntity> queryResult,
    required List<PokemonListItemEntity> pokemonsList,
    required List<Color> dominantColorsData,
    required bool goToDetail,
    required String? pokemonName,
    required Color? dominantColor,
  }) = _PokedexSearchState;

  factory PokedexSearchState.initial() => const PokedexSearchState(
        isLoading: true,
        isRefreshed: false,
        goToDetail: false,
        message: null,
        pokemonName: null,
        dominantColor: null,
        dominantColorsData: [],
        queryResult: [],
        pokemonsList: [],
      );
}
