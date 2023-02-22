// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pokedex_f/app/pages/pokeball/bloc/pokeball_bloc.dart' as _i16;
import 'package:pokedex_f/app/pages/pokedex_detail/bloc/pokedex_detail_bloc.dart'
    as _i17;
import 'package:pokedex_f/app/pages/pokedex_list/bloc/pokedex_list_bloc.dart'
    as _i18;
import 'package:pokedex_f/app/pages/splash/bloc/splash_bloc.dart' as _i7;
import 'package:pokedex_f/data/datasources/local/dao/pokemon_list_item_dao.dart'
    as _i6;
import 'package:pokedex_f/data/datasources/local/db/pokedex_database.dart'
    as _i4;
import 'package:pokedex_f/data/datasources/local/pokedex_local_datasource.dart'
    as _i8;
import 'package:pokedex_f/data/datasources/remote/api/api_services.dart' as _i3;
import 'package:pokedex_f/data/datasources/remote/pokedex_remote_datasource.dart'
    as _i5;
import 'package:pokedex_f/di/app_module.dart' as _i19;
import 'package:pokedex_f/domain/repositories/pokedex_repository.dart' as _i9;
import 'package:pokedex_f/domain/usecases/catch_pokemon.dart' as _i11;
import 'package:pokedex_f/domain/usecases/get_all_pokemon.dart' as _i12;
import 'package:pokedex_f/domain/usecases/get_captured_pokemon.dart' as _i13;
import 'package:pokedex_f/domain/usecases/get_captured_pokemon_by_name.dart'
    as _i14;
import 'package:pokedex_f/domain/usecases/get_pokemon_by_name.dart' as _i15;
import 'package:pokedex_f/domain/usecases/release_pokemon.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.lazySingleton<_i3.ApiServices>(() => appModule.getPokeApi());
    gh.lazySingletonAsync<_i4.PokedexDatabase>(() => appModule.getDatabase());
    gh.lazySingleton<_i5.PokedexRemoteDatasource>(
        () => _i5.PokedexRemoteDatasource(gh<_i3.ApiServices>()));
    gh.lazySingletonAsync<_i6.PokemonListItemDao>(
        () async => appModule.getDao(await getAsync<_i4.PokedexDatabase>()));
    gh.factory<_i7.SplashBloc>(() => _i7.SplashBloc());
    gh.lazySingletonAsync<_i8.PokedexLocalDatasource>(() async =>
        _i8.PokedexLocalDatasource(await getAsync<_i6.PokemonListItemDao>()));
    gh.lazySingletonAsync<_i9.PokedexRepository>(
        () async => appModule.getRepository(
              gh<_i5.PokedexRemoteDatasource>(),
              await getAsync<_i8.PokedexLocalDatasource>(),
            ));
    gh.lazySingletonAsync<_i10.ReleasePokemon>(() async => appModule
        .provideReleasePokemonUsecase(await getAsync<_i9.PokedexRepository>()));
    gh.lazySingletonAsync<_i11.CatchPokemon>(() async => appModule
        .provideCatchPokemonUsecase(await getAsync<_i9.PokedexRepository>()));
    gh.lazySingletonAsync<_i12.GetAllPokemon>(() async => appModule
        .provideGetAllPokemonUsecase(await getAsync<_i9.PokedexRepository>()));
    gh.lazySingletonAsync<_i13.GetCapturedPokemon>(() async =>
        appModule.provideGetCapturedPokemonUsecase(
            await getAsync<_i9.PokedexRepository>()));
    gh.lazySingletonAsync<_i14.GetCapturedPokemonByName>(() async =>
        appModule.provideGetCapturedPokemonByNameUsecase(
            await getAsync<_i9.PokedexRepository>()));
    gh.lazySingletonAsync<_i15.GetPokemonByName>(() async =>
        appModule.provideGetPokemonByNameUsecase(
            await getAsync<_i9.PokedexRepository>()));
    gh.factoryAsync<_i16.PokeballBloc>(
        () async => _i16.PokeballBloc(await getAsync<_i9.PokedexRepository>()));
    gh.factoryAsync<_i17.PokedexDetailBloc>(() async =>
        _i17.PokedexDetailBloc(await getAsync<_i9.PokedexRepository>()));
    gh.factoryAsync<_i18.PokedexListBloc>(() async =>
        _i18.PokedexListBloc(await getAsync<_i9.PokedexRepository>()));
    return this;
  }
}

class _$AppModule extends _i19.AppModule {}
