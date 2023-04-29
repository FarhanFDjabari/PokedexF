import 'package:flutter/painting.dart';
import 'package:pokedex_f/data/models/pokemon.dart';
import 'package:pokedex_f/data/models/pokemon_list.dart';
import 'package:pokedex_f/data/models/pokemon_list_item.dart';

const testPokemonDetail = Pokemon(
  name: 'bulbasaur',
  id: 1,
);

const testPokemonList = PokemonList(
  count: 1118,
  next: null,
  previous: null,
  results: [
    PokemonListItem(
      name: 'bulbasaur',
      url: 'https://pokeapi.co/api/v2/pokemon/1/',
    ),
    PokemonListItem(
      name: 'ivysaur',
      url: 'https://pokeapi.co/api/v2/pokemon/2/',
    ),
    PokemonListItem(
      name: 'venusaur',
      url: 'https://pokeapi.co/api/v2/pokemon/3/',
    ),
  ],
);

const testPokemonListItem = [
  PokemonListItem(
    name: 'bulbasaur',
    url: 'https://pokeapi.co/api/v2/pokemon/1/',
  ),
  PokemonListItem(
    name: 'ivysaur',
    url: 'https://pokeapi.co/api/v2/pokemon/2/',
  ),
  PokemonListItem(
    name: 'venusaur',
    url: 'https://pokeapi.co/api/v2/pokemon/3/',
  ),
];

const testPokemonDominantColors = [
  Color(0xff123aba),
  Color(0xff11aaaa),
  Color(0xff08bcda),
];
