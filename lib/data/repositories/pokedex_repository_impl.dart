import 'package:injectable/injectable.dart';
import 'package:pokedex_f/data/datasources/local/pokedex_local_datasource.dart';
import 'package:pokedex_f/data/datasources/remote/pokedex_remote_datasource.dart';
import 'package:pokedex_f/domain/entities/pokemon_entity.dart';
import 'package:pokedex_f/domain/entities/pokemon_list_item_entity.dart';
import 'package:pokedex_f/data/models/pokemon_list.dart';
import 'package:dartz/dartz.dart';
import 'package:pokedex_f/domain/repositories/pokedex_repository.dart';

@LazySingleton(as: PokedexRepository)
class PokedexRepositoryImpl extends PokedexRepository {
  final PokedexRemoteDatasource remoteDatasource;
  final PokedexLocalDatasource localDatasource;

  PokedexRepositoryImpl({
    required this.remoteDatasource,
    required this.localDatasource,
  });

  @override
  Future<Either<String, String>> catchPokemon(
      PokemonListItemEntity pokemon) async {
    try {
      await localDatasource.catchPokemon(pokemon: pokemon);
    } catch (e) {
      return Left(e.toString());
    }

    return Right("Successfully catch ${pokemon.name}");
  }

  @override
  Future<Either<String, PokemonList>> getAllPokemon(
      int limit, int offset) async {
    try {
      final result =
          await remoteDatasource.getAllPokemon(limit: limit, offset: offset);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<PokemonListItemEntity>>>
      getCapturedPokemon() async {
    try {
      final result = await localDatasource.getCaughtPokemon();
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, PokemonEntity>> getPokemonByName(
      String pokemonName) async {
    try {
      final result =
          await remoteDatasource.getPokemonByName(pokemonName: pokemonName);
      return Right(result.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> releasePokemon(
      PokemonListItemEntity pokemon) async {
    try {
      await localDatasource.releasePokemon(pokemon: pokemon);
    } catch (e) {
      return Left(e.toString());
    }

    return Right("${pokemon.name} released!");
  }

  @override
  Future<Either<String, PokemonListItemEntity?>> getCapturedPokemonByName(
      String name) async {
    try {
      final result = await localDatasource.getCaughtPokemonByName(name);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
