import 'package:dartz/dartz.dart';
import 'package:pokedex_f/data/models/pokemon_list.dart';
import 'package:pokedex_f/domain/repositories/pokedex_repository.dart';

class GetAllPokemon {
  final PokedexRepository _repository;

  GetAllPokemon(this._repository);

  Future<Either<String, PokemonList>> invoke(int limit, int offset) {
    return _repository.getAllPokemon(limit, offset);
  }
}
