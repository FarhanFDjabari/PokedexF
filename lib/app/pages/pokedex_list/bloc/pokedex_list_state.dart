part of 'pokedex_list_bloc.dart';

@freezed
class PokedexListState with _$PokedexListState {
  const PokedexListState._();
  const factory PokedexListState({
    required bool isLoading,
    required bool isRefreshed,
    required bool isLastPage,
    required bool isFirstPage,
    required int currentPage,
    required String? message,
    required List<PokemonListItemEntity> pokemons,
  }) = _PokedexListState;

  factory PokedexListState.initial() => const PokedexListState(
        isLoading: true,
        isRefreshed: false,
        isLastPage: false,
        isFirstPage: true,
        currentPage: 0,
        message: null,
        pokemons: [],
      );
}
