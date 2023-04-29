import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_f/app/pages/pokedex_detail/bloc/pokedex_detail_bloc.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  group('pokedex detail bloc test', () {
    late PokedexDetailBloc bloc;
    late MockPokedexRepositoryImpl repositoryImpl;

    setUp(() {
      repositoryImpl = MockPokedexRepositoryImpl();
      bloc = PokedexDetailBloc(repositoryImpl);
    });

    blocTest<PokedexDetailBloc, PokedexDetailState>(
      'emits PokemonEntity when PokedexDetailEvent.getPokemon() is added.',
      build: () {
        when(repositoryImpl.getPokemonByName('bulbasaur'))
            .thenAnswer((_) async => Right(testPokemonDetail.toEntity()));
        when(repositoryImpl.getCapturedPokemonByName('bulbasaur'))
            .thenAnswer((_) async => const Right(null));
        return bloc;
      },
      act: (bloc) => bloc.add(const PokedexDetailEvent.getPokemon('bulbasaur')),
      verify: (bloc) {
        verify(repositoryImpl.getPokemonByName('bulbasaur'));
        verify(repositoryImpl.getCapturedPokemonByName('bulbasaur'));
      },
      expect: () => <PokedexDetailState>[
        PokedexDetailState.initial().copyWith(
          isLoading: false,
          isAlreadyCaught: false,
          isRefreshed: true,
          pokemon: testPokemonDetail.toEntity(),
        ),
      ],
    );

    blocTest<PokedexDetailBloc, PokedexDetailState>(
      'isAlreadyCaughtParameter should true when PokedexDetailEvent.catchPokemon() is added.',
      build: () {
        when(repositoryImpl
                .catchPokemon(testPokemonDetail.toEntity().toItemListEntity()))
            .thenAnswer((_) async => const Right("success"));
        when(repositoryImpl.getPokemonByName('bulbasaur'))
            .thenAnswer((_) async => Right(testPokemonDetail.toEntity()));
        when(repositoryImpl.getCapturedPokemonByName('bulbasaur')).thenAnswer(
            (_) async => Right(testPokemonListItem.first.toEntity()));
        return bloc;
      },
      wait: const Duration(milliseconds: 3500),
      act: (bloc) => bloc
        ..add(PokedexDetailEvent.catchPokemon(testPokemonDetail.toEntity()))
        ..add(const PokedexDetailEvent.getPokemon('bulbasaur')),
      verify: (bloc) {
        verify(repositoryImpl
            .catchPokemon(testPokemonDetail.toEntity().toItemListEntity()));
        verify(repositoryImpl.getPokemonByName('bulbasaur'));
        verify(repositoryImpl.getCapturedPokemonByName('bulbasaur'));
      },
      expect: () => [
        PokedexDetailState.initial().copyWith(
          isCatching: true,
        ),
        PokedexDetailState.initial().copyWith(
          isLoading: false,
          isCatching: true,
          isRefreshed: true,
          isAlreadyCaught: true,
          isCatchOrReleaseSuccess: false,
          pokemon: testPokemonDetail.toEntity(),
        ),
        PokedexDetailState.initial().copyWith(
          isLoading: false,
          isAlreadyCaught: true,
          isRefreshed: true,
          isCatchOrReleaseSuccess: true,
          pokemon: testPokemonDetail.toEntity(),
        ),
      ],
    );

    blocTest<PokedexDetailBloc, PokedexDetailState>(
      'isAlreadyCaughtParameter should false when PokedexDetailEvent.releasePokemon() is added.',
      build: () {
        when(repositoryImpl
                .catchPokemon(testPokemonDetail.toEntity().toItemListEntity()))
            .thenAnswer((_) async => const Right("success"));
        when(repositoryImpl.releasePokemon(
                testPokemonDetail.toEntity().toItemListEntity()))
            .thenAnswer((_) async => const Right("success"));
        when(repositoryImpl.getPokemonByName('bulbasaur'))
            .thenAnswer((_) async => Right(testPokemonDetail.toEntity()));
        when(repositoryImpl.getCapturedPokemonByName('bulbasaur')).thenAnswer(
            (_) async => Right(testPokemonListItem.first.toEntity()));
        return bloc;
      },
      wait: const Duration(milliseconds: 1500),
      seed: () {
        return PokedexDetailState.initial().copyWith(
          isLoading: false,
          isAlreadyCaught: true,
          isCatchOrReleaseSuccess: true,
          pokemon: testPokemonDetail.toEntity(),
        );
      },
      act: (bloc) => bloc
        ..add(PokedexDetailEvent.releasePokemon(testPokemonDetail.toEntity()))
        ..add(const PokedexDetailEvent.getPokemon('bulbasaur')),
      verify: (bloc) {
        verify(repositoryImpl
            .releasePokemon(testPokemonDetail.toEntity().toItemListEntity()));
        verify(repositoryImpl.getPokemonByName('bulbasaur'));
        verify(repositoryImpl.getCapturedPokemonByName('bulbasaur'));
      },
      expect: () => [
        PokedexDetailState.initial().copyWith(
          isLoading: false,
          isAlreadyCaught: true,
          isReleasing: true,
          isCatchOrReleaseSuccess: true,
          pokemon: testPokemonDetail.toEntity(),
        ),
        PokedexDetailState.initial().copyWith(
          isLoading: false,
          isReleasing: true,
          isRefreshed: true,
          isAlreadyCaught: true,
          isCatchOrReleaseSuccess: true,
          pokemon: testPokemonDetail.toEntity(),
        ),
        PokedexDetailState.initial().copyWith(
          isLoading: false,
          isAlreadyCaught: false,
          isRefreshed: true,
          isCatchOrReleaseSuccess: true,
          pokemon: testPokemonDetail.toEntity(),
        ),
      ],
    );

    blocTest<PokedexDetailBloc, PokedexDetailState>(
      'isAlreadyCaughtParameter should true when PokedexDetailEvent.recatchPokemon() is added.',
      build: () {
        when(repositoryImpl
                .catchPokemon(testPokemonDetail.toEntity().toItemListEntity()))
            .thenAnswer((_) async => const Right("success"));
        when(repositoryImpl.getPokemonByName('bulbasaur'))
            .thenAnswer((_) async => Right(testPokemonDetail.toEntity()));
        when(repositoryImpl.getCapturedPokemonByName('bulbasaur')).thenAnswer(
            (_) async => Right(testPokemonListItem.first.toEntity()));
        return bloc;
      },
      seed: () {
        return PokedexDetailState.initial().copyWith(
          isLoading: false,
          isAlreadyCaught: false,
          isCatchOrReleaseSuccess: true,
          isRefreshed: true,
          pokemon: testPokemonDetail.toEntity(),
        );
      },
      act: (bloc) => bloc
        ..add(PokedexDetailEvent.recatchPokemon(testPokemonDetail.toEntity()))
        ..add(const PokedexDetailEvent.getPokemon('bulbasaur')),
      verify: (bloc) {
        verify(repositoryImpl
            .catchPokemon(testPokemonDetail.toEntity().toItemListEntity()));
        verify(repositoryImpl.getPokemonByName('bulbasaur'));
      },
      expect: () => [
        PokedexDetailState.initial().copyWith(
          isLoading: false,
          isAlreadyCaught: true,
          isRefreshed: true,
          pokemon: testPokemonDetail.toEntity(),
        ),
      ],
    );
  });
}
