import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_f/data/datasources/remote/pokedex_remote_datasource.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  group('pokedex remote datasource test', () {
    late PokedexRemoteDatasource datasource;
    late MockApiServices api;

    setUp(() {
      api = MockApiServices();
      datasource = PokedexRemoteDatasource(api);
    });

    test('should return PokemonList when getAllPokemon called', () {
      when(api.getAllPokemon(limit: 20, offset: 20))
          .thenAnswer((_) async => testPokemonList);

      expect(datasource.getAllPokemon(limit: 20, offset: 20),
          completion(equals(testPokemonList)));
    });

    test('should return Pokemon when getPokemonByName called', () {
      when(api.getPokemonByName(pokemonName: 'bulbasaur'))
          .thenAnswer((_) async => testPokemonDetail);

      expect(datasource.getPokemonByName(pokemonName: 'bulbasaur'),
          completion(equals(testPokemonDetail)));
    });
  });
}
