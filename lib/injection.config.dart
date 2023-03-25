// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pokedex_f/app/pages/pokeball/bloc/pokeball_bloc.dart' as _i17;
import 'package:pokedex_f/app/pages/pokedex_detail/bloc/pokedex_detail_bloc.dart'
    as _i18;
import 'package:pokedex_f/app/pages/pokedex_list/bloc/pokedex_list_bloc.dart'
    as _i19;
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
import 'package:pokedex_f/data/repositories/pokedex_repository_impl.dart'
    as _i10;
import 'package:pokedex_f/di/app_module.dart' as _i20;
import 'package:pokedex_f/domain/repositories/pokedex_repository.dart' as _i9;
import 'package:pokedex_f/domain/usecases/catch_pokemon.dart' as _i12;
import 'package:pokedex_f/domain/usecases/get_all_pokemon.dart' as _i13;
import 'package:pokedex_f/domain/usecases/get_captured_pokemon.dart' as _i14;
import 'package:pokedex_f/domain/usecases/get_captured_pokemon_by_name.dart'
    as _i15;
import 'package:pokedex_f/domain/usecases/get_pokemon_by_name.dart' as _i16;
import 'package:pokedex_f/domain/usecases/release_pokemon.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.lazySingleton<_i3.ApiServices>(() => appModule.getPokeApi());
    await gh.lazySingletonAsync<_i4.PokedexDatabase>(
      () => appModule.getDatabase(),
      preResolve: true,
    );
    gh.lazySingleton<_i5.PokedexRemoteDatasource>(
        () => _i5.PokedexRemoteDatasource(gh<_i3.ApiServices>()));
    gh.lazySingleton<_i6.PokemonListItemDao>(
        () => appModule.getDao(gh<_i4.PokedexDatabase>()));
    gh.factory<_i7.SplashBloc>(() => _i7.SplashBloc());
    gh.lazySingleton<_i8.PokedexLocalDatasource>(
        () => _i8.PokedexLocalDatasource(gh<_i6.PokemonListItemDao>()));
    gh.lazySingleton<_i9.PokedexRepository>(() => _i10.PokedexRepositoryImpl(
          remoteDatasource: gh<_i5.PokedexRemoteDatasource>(),
          localDatasource: gh<_i8.PokedexLocalDatasource>(),
        ));
    gh.lazySingleton<_i11.ReleasePokemon>(
        () => _i11.ReleasePokemon(gh<_i9.PokedexRepository>()));
    gh.lazySingleton<_i12.CatchPokemon>(
        () => _i12.CatchPokemon(gh<_i9.PokedexRepository>()));
    gh.lazySingleton<_i13.GetAllPokemon>(
        () => _i13.GetAllPokemon(gh<_i9.PokedexRepository>()));
    gh.lazySingleton<_i14.GetCapturedPokemon>(
        () => _i14.GetCapturedPokemon(gh<_i9.PokedexRepository>()));
    gh.lazySingleton<_i15.GetCapturedPokemonByName>(
        () => _i15.GetCapturedPokemonByName(gh<_i9.PokedexRepository>()));
    gh.lazySingleton<_i16.GetPokemonByName>(
        () => _i16.GetPokemonByName(gh<_i9.PokedexRepository>()));
    gh.factory<_i17.PokeballBloc>(
        () => _i17.PokeballBloc(gh<_i14.GetCapturedPokemon>()));
    gh.factory<_i18.PokedexDetailBloc>(() => _i18.PokedexDetailBloc(
          gh<_i12.CatchPokemon>(),
          gh<_i16.GetPokemonByName>(),
          gh<_i15.GetCapturedPokemonByName>(),
          gh<_i11.ReleasePokemon>(),
        ));
    gh.factory<_i19.PokedexListBloc>(
        () => _i19.PokedexListBloc(gh<_i13.GetAllPokemon>()));
    return this;
  }
}

class _$AppModule extends _i20.AppModule {}
