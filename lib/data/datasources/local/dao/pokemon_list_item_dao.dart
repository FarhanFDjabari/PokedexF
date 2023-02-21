import 'package:floor/floor.dart';
import 'package:pokedex_f/domain/entities/pokemon_list_item_entity.dart';

@dao
abstract class PokemonListItemDao {
  @Query('SELECT * FROM pokedex')
  Future<List<PokemonListItemEntity>> findAllPokemon();
  @Query('SELECT * FROM pokedex WHERE name = :name LIMIT 1')
  Future<PokemonListItemEntity?> findPokemonByName(String name);
  @insert
  Future<void> catchPokemon(PokemonListItemEntity pokemon);
  @delete
  Future<void> releasePokemon(PokemonListItemEntity pokemon);
}
