part of 'pokedex_search_bloc.dart';

@freezed
class PokedexSearchEvent with _$PokedexSearchEvent {
  const factory PokedexSearchEvent.started() = _PokedexSearchEventStarted;
  const factory PokedexSearchEvent.searchPokemon(String query) =
      _PokedexSearchEventSearchPokemon;
  const factory PokedexSearchEvent.toDetail(
      String pokemonName, Color dominantColor) = _PokedexSearchEventToDetail;
}
