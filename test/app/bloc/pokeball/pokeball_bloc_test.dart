import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_f/app/pages/pokeball/bloc/pokeball_bloc.dart';
import 'package:bloc_test/bloc_test.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  group('pokeball bloc test', () {
    late PokeballBloc bloc;
    late MockPokedexRepositoryImpl repositoryImpl;

    setUp(() {
      repositoryImpl = MockPokedexRepositoryImpl();
      bloc = PokeballBloc(repositoryImpl);
    });

    blocTest<PokeballBloc, PokeballState>(
      'emits List<PokemonListItemEntity> when PokeballEvent.initial() is added.',
      build: () {
        when(repositoryImpl.getCapturedPokemon()).thenAnswer((_) =>
            Stream.value(
                testPokemonListItem.map((e) => e.toEntity()).toList()));
        return bloc;
      },
      act: (bloc) => bloc.add(const PokeballEvent.initial()),
      verify: (bloc) {
        verify(repositoryImpl.getCapturedPokemon());
      },
      expect: () => <PokeballState>[
        PokeballState.initial().copyWith(
          isRefreshed: true,
          pokemons: testPokemonListItem.map((e) => e.toEntity()).toList(),
        ),
      ],
    );

    blocTest<PokeballBloc, PokeballState>(
      'emits List<PokemonListItemEntity> and List<Color> when PokeballEvent.getCaughtPokemon() is added.',
      build: () {
        return bloc;
      },
      act: (bloc) => bloc.add(PokeballEvent.getCaughtPokemon(
        testPokemonListItem.map((e) => e.toEntity()).toList(),
        testPokemonDominantColors,
      )),
      expect: () => <PokeballState>[
        PokeballState.initial().copyWith(
          isLoading: false,
          isRefreshed: true,
          isDominantColorsRefreshed: true,
          pokemons: testPokemonListItem.map((e) => e.toEntity()).toList(),
          dominantColors: testPokemonDominantColors,
        ),
      ],
    );

    blocTest<PokeballBloc, PokeballState>(
      'emits List<PokemonListItemEntity> when PokeballEvent.getDominantColors() is added.',
      build: () {
        return bloc;
      },
      act: (bloc) => bloc.add(PokeballEvent.getDominantColors(
        testPokemonListItem.map((e) => e.toEntity()).toList(),
      )),
      expect: () => <PokeballState>[
        PokeballState.initial().copyWith(
          isLoading: true,
          isRefreshed: true,
          isDominantColorsRefreshed: false,
          pokemons: testPokemonListItem.map((e) => e.toEntity()).toList(),
        ),
      ],
    );
  });
}
