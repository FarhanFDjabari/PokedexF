import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_f/domain/entities/pokemon_list_item_entity.dart';
import 'package:pokedex_f/domain/repositories/pokedex_repository.dart';

@lazySingleton
class GetCapturedPokemon {
  final PokedexRepository _repository;

  GetCapturedPokemon(this._repository);

  Stream<List<PokemonListItemEntity>> invoke() {
    return _repository.getCapturedPokemon();
  }
}
