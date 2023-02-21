import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:pokedex_f/data/datasources/local/dao/pokemon_list_item_dao.dart';
import 'package:pokedex_f/domain/entities/pokemon_list_item_entity.dart';

part 'pokedex_database.g.dart';

@Database(version: 1, entities: [PokemonListItemEntity])
abstract class PokedexDatabase extends FloorDatabase {
  PokemonListItemDao get pokemonListItemDao;
}
