import 'package:injectable/injectable.dart';
import 'package:pokedex_f/data/datasources/local/dao/pokemon_list_item_dao.dart';
import 'package:pokedex_f/data/datasources/local/db/pokedex_database.dart';
import 'package:pokedex_f/data/datasources/remote/api/api_services.dart';
import 'package:pokedex_f/data/datasources/remote/env/environment.dart';
import 'package:pokedex_f/data/datasources/remote/interceptor/dio.dart';

@module
abstract class AppModule {
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

  @preResolve
  @lazySingleton
  Future<PokedexDatabase> getDatabase() async =>
      await $FloorPokedexDatabase.databaseBuilder('pokedex.db').build();
}
