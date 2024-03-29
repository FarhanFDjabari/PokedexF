// Mocks generated by Mockito 5.3.2 from annotations
// in pokedex_f/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;

import 'package:dartz/dartz.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:pokedex_f/data/datasources/local/dao/pokemon_list_item_dao.dart'
    as _i11;
import 'package:pokedex_f/data/datasources/local/pokedex_local_datasource.dart'
    as _i3;
import 'package:pokedex_f/data/datasources/remote/api/api_services.dart'
    as _i12;
import 'package:pokedex_f/data/datasources/remote/pokedex_remote_datasource.dart'
    as _i2;
import 'package:pokedex_f/data/models/pokemon.dart' as _i6;
import 'package:pokedex_f/data/models/pokemon_list.dart' as _i5;
import 'package:pokedex_f/data/repositories/pokedex_repository_impl.dart'
    as _i7;
import 'package:pokedex_f/domain/entities/pokemon_entity.dart' as _i10;
import 'package:pokedex_f/domain/entities/pokemon_list_item_entity.dart' as _i9;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakePokedexRemoteDatasource_0 extends _i1.SmartFake
    implements _i2.PokedexRemoteDatasource {
  _FakePokedexRemoteDatasource_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePokedexLocalDatasource_1 extends _i1.SmartFake
    implements _i3.PokedexLocalDatasource {
  _FakePokedexLocalDatasource_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_2<L, R> extends _i1.SmartFake implements _i4.Either<L, R> {
  _FakeEither_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePokemonList_3 extends _i1.SmartFake implements _i5.PokemonList {
  _FakePokemonList_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePokemon_4 extends _i1.SmartFake implements _i6.Pokemon {
  _FakePokemon_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PokedexRepositoryImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockPokedexRepositoryImpl extends _i1.Mock
    implements _i7.PokedexRepositoryImpl {
  MockPokedexRepositoryImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.PokedexRemoteDatasource get remoteDatasource => (super.noSuchMethod(
        Invocation.getter(#remoteDatasource),
        returnValue: _FakePokedexRemoteDatasource_0(
          this,
          Invocation.getter(#remoteDatasource),
        ),
      ) as _i2.PokedexRemoteDatasource);
  @override
  _i3.PokedexLocalDatasource get localDatasource => (super.noSuchMethod(
        Invocation.getter(#localDatasource),
        returnValue: _FakePokedexLocalDatasource_1(
          this,
          Invocation.getter(#localDatasource),
        ),
      ) as _i3.PokedexLocalDatasource);
  @override
  _i8.Future<_i4.Either<String, String>> catchPokemon(
          _i9.PokemonListItemEntity? pokemon) =>
      (super.noSuchMethod(
        Invocation.method(
          #catchPokemon,
          [pokemon],
        ),
        returnValue: _i8.Future<_i4.Either<String, String>>.value(
            _FakeEither_2<String, String>(
          this,
          Invocation.method(
            #catchPokemon,
            [pokemon],
          ),
        )),
      ) as _i8.Future<_i4.Either<String, String>>);
  @override
  _i8.Future<_i4.Either<String, _i5.PokemonList>> getAllPokemon(
    int? limit,
    int? offset,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllPokemon,
          [
            limit,
            offset,
          ],
        ),
        returnValue: _i8.Future<_i4.Either<String, _i5.PokemonList>>.value(
            _FakeEither_2<String, _i5.PokemonList>(
          this,
          Invocation.method(
            #getAllPokemon,
            [
              limit,
              offset,
            ],
          ),
        )),
      ) as _i8.Future<_i4.Either<String, _i5.PokemonList>>);
  @override
  _i8.Stream<List<_i9.PokemonListItemEntity>> getCapturedPokemon() =>
      (super.noSuchMethod(
        Invocation.method(
          #getCapturedPokemon,
          [],
        ),
        returnValue: _i8.Stream<List<_i9.PokemonListItemEntity>>.empty(),
      ) as _i8.Stream<List<_i9.PokemonListItemEntity>>);
  @override
  _i8.Future<_i4.Either<String, _i10.PokemonEntity>> getPokemonByName(
          String? pokemonName) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPokemonByName,
          [pokemonName],
        ),
        returnValue: _i8.Future<_i4.Either<String, _i10.PokemonEntity>>.value(
            _FakeEither_2<String, _i10.PokemonEntity>(
          this,
          Invocation.method(
            #getPokemonByName,
            [pokemonName],
          ),
        )),
      ) as _i8.Future<_i4.Either<String, _i10.PokemonEntity>>);
  @override
  _i8.Future<_i4.Either<String, String>> releasePokemon(
          _i9.PokemonListItemEntity? pokemon) =>
      (super.noSuchMethod(
        Invocation.method(
          #releasePokemon,
          [pokemon],
        ),
        returnValue: _i8.Future<_i4.Either<String, String>>.value(
            _FakeEither_2<String, String>(
          this,
          Invocation.method(
            #releasePokemon,
            [pokemon],
          ),
        )),
      ) as _i8.Future<_i4.Either<String, String>>);
  @override
  _i8.Future<
      _i4.Either<String, _i9.PokemonListItemEntity?>> getCapturedPokemonByName(
          String? name) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCapturedPokemonByName,
          [name],
        ),
        returnValue:
            _i8.Future<_i4.Either<String, _i9.PokemonListItemEntity?>>.value(
                _FakeEither_2<String, _i9.PokemonListItemEntity?>(
          this,
          Invocation.method(
            #getCapturedPokemonByName,
            [name],
          ),
        )),
      ) as _i8.Future<_i4.Either<String, _i9.PokemonListItemEntity?>>);
}

/// A class which mocks [PokemonListItemDao].
///
/// See the documentation for Mockito's code generation for more information.
class MockPokemonListItemDao extends _i1.Mock
    implements _i11.PokemonListItemDao {
  MockPokemonListItemDao() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Stream<List<_i9.PokemonListItemEntity>> findAllPokemon() =>
      (super.noSuchMethod(
        Invocation.method(
          #findAllPokemon,
          [],
        ),
        returnValue: _i8.Stream<List<_i9.PokemonListItemEntity>>.empty(),
      ) as _i8.Stream<List<_i9.PokemonListItemEntity>>);
  @override
  _i8.Future<_i9.PokemonListItemEntity?> findPokemonByName(String? name) =>
      (super.noSuchMethod(
        Invocation.method(
          #findPokemonByName,
          [name],
        ),
        returnValue: _i8.Future<_i9.PokemonListItemEntity?>.value(),
      ) as _i8.Future<_i9.PokemonListItemEntity?>);
  @override
  _i8.Future<void> catchPokemon(_i9.PokemonListItemEntity? pokemon) =>
      (super.noSuchMethod(
        Invocation.method(
          #catchPokemon,
          [pokemon],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
  @override
  _i8.Future<void> releasePokemon(_i9.PokemonListItemEntity? pokemon) =>
      (super.noSuchMethod(
        Invocation.method(
          #releasePokemon,
          [pokemon],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
}

/// A class which mocks [ApiServices].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiServices extends _i1.Mock implements _i12.ApiServices {
  MockApiServices() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i5.PokemonList> getAllPokemon({
    int? limit = 20,
    int? offset = 20,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllPokemon,
          [],
          {
            #limit: limit,
            #offset: offset,
          },
        ),
        returnValue: _i8.Future<_i5.PokemonList>.value(_FakePokemonList_3(
          this,
          Invocation.method(
            #getAllPokemon,
            [],
            {
              #limit: limit,
              #offset: offset,
            },
          ),
        )),
      ) as _i8.Future<_i5.PokemonList>);
  @override
  _i8.Future<_i6.Pokemon> getPokemonByName({required String? pokemonName}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPokemonByName,
          [],
          {#pokemonName: pokemonName},
        ),
        returnValue: _i8.Future<_i6.Pokemon>.value(_FakePokemon_4(
          this,
          Invocation.method(
            #getPokemonByName,
            [],
            {#pokemonName: pokemonName},
          ),
        )),
      ) as _i8.Future<_i6.Pokemon>);
}

/// A class which mocks [PokedexLocalDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockPokedexLocalDatasource extends _i1.Mock
    implements _i3.PokedexLocalDatasource {
  MockPokedexLocalDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Stream<List<_i9.PokemonListItemEntity>> getCaughtPokemon() =>
      (super.noSuchMethod(
        Invocation.method(
          #getCaughtPokemon,
          [],
        ),
        returnValue: _i8.Stream<List<_i9.PokemonListItemEntity>>.empty(),
      ) as _i8.Stream<List<_i9.PokemonListItemEntity>>);
  @override
  _i8.Future<_i9.PokemonListItemEntity?> getCaughtPokemonByName(String? name) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCaughtPokemonByName,
          [name],
        ),
        returnValue: _i8.Future<_i9.PokemonListItemEntity?>.value(),
      ) as _i8.Future<_i9.PokemonListItemEntity?>);
  @override
  _i8.Future<void> catchPokemon(
          {required _i9.PokemonListItemEntity? pokemon}) =>
      (super.noSuchMethod(
        Invocation.method(
          #catchPokemon,
          [],
          {#pokemon: pokemon},
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
  @override
  _i8.Future<void> releasePokemon(
          {required _i9.PokemonListItemEntity? pokemon}) =>
      (super.noSuchMethod(
        Invocation.method(
          #releasePokemon,
          [],
          {#pokemon: pokemon},
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
}

/// A class which mocks [PokedexRemoteDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockPokedexRemoteDatasource extends _i1.Mock
    implements _i2.PokedexRemoteDatasource {
  MockPokedexRemoteDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i5.PokemonList> getAllPokemon({
    int? limit = 20,
    int? offset = 20,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllPokemon,
          [],
          {
            #limit: limit,
            #offset: offset,
          },
        ),
        returnValue: _i8.Future<_i5.PokemonList>.value(_FakePokemonList_3(
          this,
          Invocation.method(
            #getAllPokemon,
            [],
            {
              #limit: limit,
              #offset: offset,
            },
          ),
        )),
      ) as _i8.Future<_i5.PokemonList>);
  @override
  _i8.Future<_i6.Pokemon> getPokemonByName({required String? pokemonName}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPokemonByName,
          [],
          {#pokemonName: pokemonName},
        ),
        returnValue: _i8.Future<_i6.Pokemon>.value(_FakePokemon_4(
          this,
          Invocation.method(
            #getPokemonByName,
            [],
            {#pokemonName: pokemonName},
          ),
        )),
      ) as _i8.Future<_i6.Pokemon>);
}
