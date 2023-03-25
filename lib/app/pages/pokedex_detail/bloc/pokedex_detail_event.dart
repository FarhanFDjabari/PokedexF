part of 'pokedex_detail_bloc.dart';

@freezed
class PokedexDetailEvent with _$PokedexDetailEvent {
  const factory PokedexDetailEvent.initial() = _PokedexDetailEventInitial;
  const factory PokedexDetailEvent.getPokemon(String name) =
      _PokedexDetailEventGetPokemon;
  const factory PokedexDetailEvent.catchPokemon(PokemonEntity? pokemon) =
      _PokedexDetailEventCatchPokemon;
  const factory PokedexDetailEvent.releasePokemon(PokemonEntity? pokemon) =
      _PokedexDetailEventReleasePokemon;
}
