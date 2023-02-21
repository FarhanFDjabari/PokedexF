import 'package:injectable/injectable.dart';
import 'package:pokedex_f/data/datasources/local/dao/pokemon_list_item_dao.dart';
import 'package:pokedex_f/domain/entities/pokemon_list_item_entity.dart';

@lazySingleton
class PokedexLocalDatasource {
  final PokemonListItemDao _dao;

  PokedexLocalDatasource(this._dao);

  Future<List<PokemonListItemEntity>> getCaughtPokemon() {
    return _dao.findAllPokemon();
  }

  Future<PokemonListItemEntity?> getCaughtPokemonByName(String name) {
    return _dao.findPokemonByName(name);
  }

  Future<void> catchPokemon({required PokemonListItemEntity pokemon}) {
    return _dao.catchPokemon(pokemon);
  }

  Future<void> releasePokemon({required PokemonListItemEntity pokemon}) {
    return _dao.releasePokemon(pokemon);
  }
}
