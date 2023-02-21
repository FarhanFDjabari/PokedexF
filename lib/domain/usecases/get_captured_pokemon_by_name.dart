import 'package:dartz/dartz.dart';
import 'package:pokedex_f/domain/entities/pokemon_list_item_entity.dart';
import 'package:pokedex_f/domain/repositories/pokedex_repository.dart';

class GetCapturedPokemonByName {
  final PokedexRepository _repository;

  GetCapturedPokemonByName(this._repository);

  Future<Either<String, PokemonListItemEntity?>> invoke(String name) {
    return _repository.getCapturedPokemonByName(name);
  }
}
