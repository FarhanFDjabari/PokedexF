import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_f/data/repositories/pokedex_repository_impl.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  group('pokedex repository test', () {
    late MockPokedexLocalDatasource localDataSource;
    late MockPokedexRemoteDatasource remoteDataSource;
    late PokedexRepositoryImpl repositoryImpl;

    setUp(() {
      localDataSource = MockPokedexLocalDatasource();
      remoteDataSource = MockPokedexRemoteDatasource();
      repositoryImpl = PokedexRepositoryImpl(
        localDatasource: localDataSource,
        remoteDatasource: remoteDataSource,
      );
    });

    test('should return PokemonEntity when getPokemonByName is called',
        () async {
      when(remoteDataSource.getPokemonByName(pokemonName: 'bulbasaur'))
          .thenAnswer((_) async => testPokemonDetail);
      final result = await repositoryImpl.getPokemonByName('bulbasaur');

      verify(remoteDataSource.getPokemonByName(pokemonName: 'bulbasaur'));
      expect(result, equals(Right(testPokemonDetail.toEntity())));
    });

    test('should return PokemonList when getAllPokemon is called', () async {
      when(remoteDataSource.getAllPokemon(limit: 20, offset: 0))
          .thenAnswer((_) async => testPokemonList);
      final result = await repositoryImpl.getAllPokemon(20, 0);

      verify(remoteDataSource.getAllPokemon(limit: 20, offset: 0));
      expect(result, equals(const Right(testPokemonList)));
    });

    test(
        'should return List<PokemonListItemEntity> when getCapturedPokemon is called',
        () async {
      when(localDataSource.getCaughtPokemon()).thenAnswer((_) =>
          Stream.value(testPokemonListItem.map((e) => e.toEntity()).toList()));
      final result = await repositoryImpl.getCapturedPokemon().first;

      verify(localDataSource.getCaughtPokemon());
      expect(result.first.id, equals(testPokemonListItem.first.toEntity().id));
    });

    test(
        'should return PokemonListItemEntity when getCapturedPokemonByName is called',
        () async {
      when(localDataSource.getCaughtPokemonByName('bulbasaur'))
          .thenAnswer((_) async => testPokemonListItem.first.toEntity());
      final result = await repositoryImpl.getCapturedPokemonByName('bulbasaur');

      verify(localDataSource.getCaughtPokemonByName('bulbasaur'));
      expect(result.getOrElse(() => null),
          equals(testPokemonListItem.first.toEntity()));
    });

    test(
        'should return Successfully catch bulbasaur when catchPokemon is called',
        () async {
      when(localDataSource.catchPokemon(
              pokemon: testPokemonListItem.first.toEntity()))
          .thenAnswer((_) async => Future.value(null));
      final result = await repositoryImpl
          .catchPokemon(testPokemonListItem.first.toEntity());

      verify(localDataSource.catchPokemon(
          pokemon: testPokemonListItem.first.toEntity()));
      expect(result.getOrElse(() => 'Failed to catch bulbasaur'),
          equals('Successfully catch bulbasaur'));
    });

    test('should return bulbasaur released! when releasePokemon is called',
        () async {
      when(localDataSource.releasePokemon(
              pokemon: testPokemonListItem.first.toEntity()))
          .thenAnswer((_) async => Future.value(null));
      final result = await repositoryImpl
          .releasePokemon(testPokemonListItem.first.toEntity());

      verify(localDataSource.releasePokemon(
          pokemon: testPokemonListItem.first.toEntity()));
      expect(result.getOrElse(() => 'Failed to release bulbasaur'),
          equals('bulbasaur released!'));
    });
  });
}
