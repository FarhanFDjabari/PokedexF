import 'package:injectable/injectable.dart';
import 'package:pokedex_f/data/datasources/local/dao/pokemon_list_item_dao.dart';
import 'package:pokedex_f/data/datasources/local/db/pokedex_database.dart';
import 'package:pokedex_f/data/datasources/local/pokedex_local_datasource.dart';
import 'package:pokedex_f/data/datasources/remote/api/api_services.dart';
import 'package:pokedex_f/data/datasources/remote/env/environment.dart';
import 'package:pokedex_f/data/datasources/remote/interceptor/dio.dart';
import 'package:pokedex_f/data/datasources/remote/pokedex_remote_datasource.dart';
import 'package:pokedex_f/data/repositories/pokedex_repository_impl.dart';
import 'package:pokedex_f/domain/repositories/pokedex_repository.dart';
import 'package:pokedex_f/domain/usecases/catch_pokemon.dart';
import 'package:pokedex_f/domain/usecases/get_all_pokemon.dart';
import 'package:pokedex_f/domain/usecases/get_captured_pokemon.dart';
import 'package:pokedex_f/domain/usecases/get_captured_pokemon_by_name.dart';
import 'package:pokedex_f/domain/usecases/get_pokemon_by_name.dart';
import 'package:pokedex_f/domain/usecases/release_pokemon.dart';

@module
abstract class AppModule {
  @lazySingleton
  PokedexRepository getRepository(
    PokedexRemoteDatasource remoteDatasource,
    PokedexLocalDatasource localDatasource,
  ) =>
      PokedexRepositoryImpl(
        remoteDatasource: remoteDatasource,
        localDatasource: localDatasource,
      );

  @lazySingleton
  PokemonListItemDao getDao(PokedexDatabase db) => db.pokemonListItemDao;

  @lazySingleton
  ApiServices getPokeApi() {
    final defHeader = Map<String, dynamic>.from({});
    defHeader["Accept"] = "application/json";

    return ApiServices(
      AppDio().getDio(
        headers: defHeader,
        connectTimeout: 30000,
        receiveTimeout: 30000,
      ),
      baseUrl: Environments.getEnvironment(),
    );
  }

  @lazySingleton
  Future<PokedexDatabase> getDatabase() async =>
      await $FloorPokedexDatabase.databaseBuilder('pokedex.db').build();

  @lazySingleton
  CatchPokemon provideCatchPokemonUsecase(PokedexRepository repository) =>
      CatchPokemon(repository);

  @lazySingleton
  GetAllPokemon provideGetAllPokemonUsecase(PokedexRepository repository) =>
      GetAllPokemon(repository);

  @lazySingleton
  GetCapturedPokemon provideGetCapturedPokemonUsecase(
          PokedexRepository repository) =>
      GetCapturedPokemon(repository);

  @lazySingleton
  GetPokemonByName provideGetPokemonByNameUsecase(
          PokedexRepository repository) =>
      GetPokemonByName(repository);

  @lazySingleton
  ReleasePokemon provideReleasePokemonUsecase(PokedexRepository repository) =>
      ReleasePokemon(repository);

  @lazySingleton
  GetCapturedPokemonByName provideGetCapturedPokemonByNameUsecase(
          PokedexRepository repository) =>
      GetCapturedPokemonByName(repository);
}
