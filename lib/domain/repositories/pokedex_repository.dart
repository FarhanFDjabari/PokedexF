import 'package:dartz/dartz.dart';
import 'package:pokedex_f/data/models/pokemon_list.dart';
import 'package:pokedex_f/domain/entities/pokemon_entity.dart';
import 'package:pokedex_f/domain/entities/pokemon_list_item_entity.dart';

abstract class PokedexRepository {
  Future<Either<String, PokemonList>> getAllPokemon(int limit, int offset);
  Future<Either<String, PokemonEntity>> getPokemonByName(String pokemonName);
  Future<Either<String, List<PokemonListItemEntity>>> getCapturedPokemon();
  Future<Either<String, PokemonListItemEntity?>> getCapturedPokemonByName(
      String name);
  Future<Either<String, String>> catchPokemon(PokemonListItemEntity pokemon);
  Future<Either<String, String>> releasePokemon(PokemonListItemEntity pokemon);
}
