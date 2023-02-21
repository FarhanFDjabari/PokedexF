import 'package:injectable/injectable.dart';
import 'package:pokedex_f/data/datasources/remote/api/api_services.dart';
import 'package:pokedex_f/data/models/pokemon.dart';
import 'package:pokedex_f/data/models/pokemon_list.dart';

@lazySingleton
class PokedexRemoteDatasource {
  final ApiServices _api;

  PokedexRemoteDatasource(this._api);

  Future<PokemonList> getAllPokemon({
    int limit = 20,
    int offset = 20,
  }) {
    return _api.getAllPokemon(limit: limit, offset: offset);
  }

  Future<Pokemon> getPokemonByName({
    required String pokemonName,
  }) {
    return _api.getPokemonByName(pokemonName: pokemonName);
  }
}
