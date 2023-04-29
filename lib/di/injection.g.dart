// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injection.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void configureFactories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory(
          (c) => ApiServices(c<Dio>('dio'), baseUrl: c<String>('baseUrl')))
      ..registerFactory(
          (c) => PokedexLocalDatasource(c<PokemonListItemDao>('dao')))
      ..registerFactory((c) => PokedexRemoteDatasource(c<ApiServices>()))
      ..registerFactory((c) => PokedexRepositoryImpl(
          remoteDatasource: c<PokedexRemoteDatasource>(),
          localDatasource: c<PokedexLocalDatasource>()))
      ..registerFactory((c) => SplashBloc())
      ..registerFactory((c) => PokedexListBloc(c<PokedexRepositoryImpl>()))
      ..registerFactory((c) => PokedexSearchBloc(c<PokedexRepositoryImpl>()))
      ..registerFactory((c) => PokedexDetailBloc(c<PokedexRepositoryImpl>()))
      ..registerFactory((c) => PokeballBloc(c<PokedexRepositoryImpl>()));
  }
}
