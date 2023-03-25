part of 'pokeball_bloc.dart';

@freezed
class PokeballEvent with _$PokeballEvent {
  const factory PokeballEvent.initial() = _PokeballEventInitial;
  const factory PokeballEvent.getCaughtPokemon(
      List<PokemonListItemEntity> pokemons) = _PokeballEventGetCaughtPokemon;
}
