import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_f/data/datasources/local/dao/pokemon_list_item_dao.dart';
import 'package:pokedex_f/data/datasources/local/db/pokedex_database.dart';
import 'package:pokedex_f/data/models/pokemon_list_item.dart';

void main() {
  group("pokedex database test", () {
    late PokedexDatabase database;
    late PokemonListItemDao dao;

    setUp(() async {
      database = await $FloorPokedexDatabase.inMemoryDatabaseBuilder().build();
      dao = database.pokemonListItemDao;
    });

    tearDown(() async {
      await database.close();
    });

    test("get all pokemon", () async {
      const pokemon = PokemonListItem(
        name: 'bulbasaur',
        url: 'https://pokeapi.co/api/v2/pokemon/1/',
      );
      await dao.catchPokemon(pokemon.toEntity());

      final actual = await dao.findAllPokemon().first;
      expect(actual, isNotEmpty);
      expect(actual.first.name, equals(pokemon.name));
    });

    test("get pokemon by name", () async {
      final pokemonEntity = const PokemonListItem(
        name: 'bulbasaur',
        url: 'https://pokeapi.co/api/v2/pokemon/1/',
      ).toEntity();
      await dao.catchPokemon(pokemonEntity);

      final actual = await dao.findPokemonByName('bulbasaur');
      expect(actual, isNotNull);
      expect(actual?.id, equals(pokemonEntity.id));
    });

    test("pokemon should released when success", () async {
      final pokemonEntity = const PokemonListItem(
        name: 'bulbasaur',
        url: 'https://pokeapi.co/api/v2/pokemon/1/',
      ).toEntity();
      await dao.catchPokemon(pokemonEntity);
      await dao.releasePokemon(pokemonEntity);

      final actual = await dao.findAllPokemon().first;
      expect(actual, isEmpty);
    });
  });
}
