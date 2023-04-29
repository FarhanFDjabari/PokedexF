part of 'pokeball_bloc.dart';

@freezed
class PokeballEvent with _$PokeballEvent {
  const factory PokeballEvent.initial() = _PokeballEventInitial;
  const factory PokeballEvent.getDominantColors(
    List<PokemonListItemEntity> pokemons,
  ) = _PokeballEventGetDominantColors;
  const factory PokeballEvent.getCaughtPokemon(
    List<PokemonListItemEntity> pokemons,
    List<Color> dominantColors,
  ) = _PokeballEventGetCaughtPokemon;
}
