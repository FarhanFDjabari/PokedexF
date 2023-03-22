import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_f/domain/entities/pokemon_list_item_entity.dart';
import 'package:pokedex_f/domain/repositories/pokedex_repository.dart';

@lazySingleton
class CatchPokemon {
  final PokedexRepository _repository;

  CatchPokemon(this._repository);

  Future<Either<String, String>> invoke(PokemonListItemEntity pokemon) {
    return _repository.catchPokemon(pokemon);
  }
}
