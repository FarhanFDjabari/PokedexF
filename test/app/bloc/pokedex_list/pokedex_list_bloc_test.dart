import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_f/app/pages/pokedex_list/bloc/pokedex_list_bloc.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  group('pokedex list bloc test', () {
    late PokedexListBloc bloc;
    late MockPokedexRepositoryImpl repositoryImpl;

    setUp(() {
      repositoryImpl = MockPokedexRepositoryImpl();
      bloc = PokedexListBloc(repositoryImpl);
    });

    blocTest<PokedexListBloc, PokedexListState>(
      'emits List<PokemonListItemEntity> when PokedexListEvent.getPokemons() is added.',
      build: () {
        when(repositoryImpl.getAllPokemon(20, 0))
            .thenAnswer((_) async => const Right(testPokemonList));
        return bloc;
      },
      act: (bloc) => bloc.add(const PokedexListEvent.getPokemons(0)),
      verify: (bloc) {
        verify(repositoryImpl.getAllPokemon(20, 0));
      },
      expect: () => <PokedexListState>[
        PokedexListState.initial().copyWith(
          isRefreshed: false,
        ),
        PokedexListState.initial().copyWith(
          isRefreshed: true,
          isLastPage: true,
          isFirstPage: true,
          currentPage: 0,
          pokemons: testPokemonListItem.map((e) => e.toEntity()).toList(),
        ),
      ],
    );

    blocTest<PokedexListBloc, PokedexListState>(
      'emits List<Color> when PokedexListEvent.getDominantColors() is added.',
      build: () {
        return bloc;
      },
      act: (bloc) => bloc.add(PokedexListEvent.getDominantColors(
        testPokemonListItem.map((e) => e.toEntity()).toList(),
        testPokemonDominantColors,
      )),
      expect: () => <PokedexListState>[
        PokedexListState.initial(),
        PokedexListState.initial().copyWith(
          isLoading: false,
          isDominantColorsRefreshed: true,
          dominantColors: testPokemonDominantColors,
        ),
      ],
    );

    blocTest<PokedexListBloc, PokedexListState>(
      'goToSearch should be true when PokedexListEvent.goToSearch() is added.',
      build: () {
        return bloc;
      },
      act: (bloc) => bloc.add(const PokedexListEvent.goToSearch()),
      expect: () => <PokedexListState>[
        PokedexListState.initial(),
        PokedexListState.initial().copyWith(
          isLoading: false,
          goToSearch: true,
        ),
      ],
    );
  });
}
