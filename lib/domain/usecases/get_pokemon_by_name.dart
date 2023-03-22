import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_f/domain/entities/pokemon_entity.dart';
import 'package:pokedex_f/domain/repositories/pokedex_repository.dart';

@lazySingleton
class GetPokemonByName {
  final PokedexRepository _repository;

  GetPokemonByName(this._repository);

  Future<Either<String, PokemonEntity>> invoke(String pokemonName) {
    return _repository.getPokemonByName(pokemonName);
  }
}
