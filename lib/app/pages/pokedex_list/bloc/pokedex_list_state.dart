part of 'pokedex_list_bloc.dart';

@freezed
class PokedexListState with _$PokedexListState {
  const PokedexListState._();
  const factory PokedexListState({
    required bool isLoading,
    required bool isRefreshed,
    required bool isDominantColorsRefreshed,
    required bool isLastPage,
    required bool isFirstPage,
    required bool goToSearch,
    required int currentPage,
    required String? message,
    required List<PokemonListItemEntity> pokemons,
    required List<Color> dominantColors,
  }) = _PokedexListState;

  factory PokedexListState.initial() => const PokedexListState(
        isLoading: true,
        isRefreshed: false,
        isDominantColorsRefreshed: false,
        isLastPage: false,
        isFirstPage: true,
        goToSearch: false,
        currentPage: 0,
        message: null,
        pokemons: [],
        dominantColors: [],
      );
}
