import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_f/app/pages/pokedex_search/bloc/pokedex_search_bloc.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late PokedexSearchBloc bloc;
  late MockPokedexRepositoryImpl repositoryImpl;

  setUp(() {
    repositoryImpl = MockPokedexRepositoryImpl();
    bloc = PokedexSearchBloc(repositoryImpl);
  });

  blocTest<PokedexSearchBloc, PokedexSearchState>(
    'emits initial pokemonLists when PokedexSearchEvent.started() called',
    build: () {
      when(repositoryImpl.getAllPokemon(1281, 0))
          .thenAnswer((_) async => const Right(testPokemonList));
      return bloc;
    },
    act: (bloc) => bloc.add(const PokedexSearchEvent.started()),
    verify: (bloc) {
      verify(repositoryImpl.getAllPokemon(1281, 0));
    },
    expect: () => [
      PokedexSearchState.initial().copyWith(
        isLoading: false,
        isRefreshed: true,
        pokemonsList: testPokemonListItem.map((e) => e.toEntity()).toList(),
      ),
    ],
  );

  blocTest<PokedexSearchBloc, PokedexSearchState>(
    'goToDetail should true when PokedexSearchEvent.toDetail() is called',
    build: () {
      return bloc;
    },
    act: (bloc) => bloc.add(PokedexSearchEvent.toDetail(
      'bulbasaur',
      testPokemonDominantColors.first,
    )),
    expect: () => [
      PokedexSearchState.initial(),
      PokedexSearchState.initial().copyWith(
        goToDetail: true,
        dominantColor: testPokemonDominantColors.first,
        pokemonName: 'bulbasaur',
      ),
    ],
  );

  blocTest<PokedexSearchBloc, PokedexSearchState>(
    'emits List<PokemonListItemEntity> and List<Color> when PokedexSearchEvent.searchDominantColors() called',
    build: () {
      return bloc;
    },
    wait: const Duration(milliseconds: 500),
    act: (bloc) => bloc.add(PokedexSearchEvent.searchDominantColors(
      testPokemonListItem.map((e) => e.toEntity()).toList(),
      testPokemonDominantColors,
    )),
    expect: () => [
      PokedexSearchState.initial(),
      PokedexSearchState.initial().copyWith(
        isLoading: false,
        isRefreshed: true,
        isDominantColorsRefreshed: true,
        queryResult: testPokemonListItem.map((e) => e.toEntity()).toList(),
        dominantColorsData: testPokemonDominantColors,
      ),
    ],
  );
}
