part of 'pokedex_list_bloc.dart';

@freezed
class PokedexListEvent with _$PokedexListEvent {
  const factory PokedexListEvent.initial() = _PokedexListEventInitial;
  const factory PokedexListEvent.goToSearch() = _PokedexListEventGoToSearch;
  const factory PokedexListEvent.getPokemons(int page) =
      _PokedexListEventGetPokemons;
  const factory PokedexListEvent.getDominantColors(
      List<PokemonListItemEntity> pokemons,
      List<Color> prevDominantColors) = _PokedexListEventGetDominantColors;
}
