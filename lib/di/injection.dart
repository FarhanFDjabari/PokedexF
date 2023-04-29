import 'package:dio/dio.dart';
import 'package:kiwi/kiwi.dart';
import 'package:pokedex_f/app/pages/pokeball/bloc/pokeball_bloc.dart';
import 'package:pokedex_f/app/pages/pokedex_detail/bloc/pokedex_detail_bloc.dart';
import 'package:pokedex_f/app/pages/pokedex_list/bloc/pokedex_list_bloc.dart';
import 'package:pokedex_f/app/pages/pokedex_search/bloc/pokedex_search_bloc.dart';
import 'package:pokedex_f/app/pages/splash/bloc/splash_bloc.dart';
import 'package:pokedex_f/data/datasources/local/dao/pokemon_list_item_dao.dart';
import 'package:pokedex_f/data/datasources/local/db/pokedex_database.dart';
import 'package:pokedex_f/data/datasources/local/pokedex_local_datasource.dart';
import 'package:pokedex_f/data/datasources/remote/api/api_services.dart';
import 'package:pokedex_f/data/datasources/remote/env/environment.dart';
import 'package:pokedex_f/data/datasources/remote/interceptor/dio.dart';
import 'package:pokedex_f/data/datasources/remote/pokedex_remote_datasource.dart';
import 'package:pokedex_f/data/repositories/pokedex_repository_impl.dart';

part 'injection.g.dart';

abstract class Injector {
  static late KiwiContainer container;

  static Future<void> setup() async {
    container = KiwiContainer();
    await _$Injector()._configure();
  }

  static final resolve = container.resolve;

  Future<void> _configure() async {
    await configureInstances();
    configureFactories();
  }

  Future<void> configureInstances() async {
    final dbInstance =
        await $FloorPokedexDatabase.databaseBuilder('pokedex.db').build();
    container.registerSingleton<PokedexDatabase>(
      (container) => dbInstance,
      name: 'database',
    );
    container.registerFactory<PokemonListItemDao>(
      (container) => container<PokedexDatabase>('database').pokemonListItemDao,
      name: 'dao',
    );
    container.registerFactory<Dio>(
      (container) {
        final defHeader = Map<String, dynamic>.from({});
        defHeader["Accept"] = "application/json";
        return AppDio().getDio(
          headers: defHeader,
          connectTimeout: 30000,
          receiveTimeout: 30000,
        );
      },
      name: 'dio',
    );
    container.registerInstance(
      Environments.getEnvironment(),
      name: 'baseUrl',
    );
  }

  @Register.factory(
    ApiServices,
    resolvers: {
      Dio: 'dio',
      String: 'baseUrl',
    },
  )
  @Register.factory(PokedexLocalDatasource, resolvers: {
    PokemonListItemDao: 'dao',
  })
  @Register.factory(PokedexRemoteDatasource)
  @Register.factory(PokedexRepositoryImpl)
  @Register.factory(SplashBloc)
  @Register.factory(PokedexListBloc)
  @Register.factory(PokedexSearchBloc)
  @Register.factory(PokedexDetailBloc)
  @Register.factory(PokeballBloc)
  void configureFactories();
}
