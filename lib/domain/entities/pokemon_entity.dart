import 'package:equatable/equatable.dart';
import 'package:pokedex_f/data/models/ability.dart';
import 'package:pokedex_f/data/models/form.dart';
import 'package:pokedex_f/data/models/game_index.dart';
import 'package:pokedex_f/data/models/held_item.dart';
import 'package:pokedex_f/data/models/move.dart';
import 'package:pokedex_f/data/models/species.dart';
import 'package:pokedex_f/data/models/sprites.dart';
import 'package:pokedex_f/data/models/stat.dart';
import 'package:pokedex_f/data/models/type.dart';
import 'package:pokedex_f/domain/entities/pokemon_list_item_entity.dart';

class PokemonEntity extends Equatable {
  final List<Ability>? abilities;
  final int? baseExperience;
  final List<Form>? forms;
  final List<GameIndex>? gameIndices;
  final double? height;
  final List<HeldItem>? heldItems;
  final int? id;
  final bool? isDefault;
  final String? locationAreaEncounters;
  final List<Move>? moves;
  final String? name;
  final int? order;
  final List<dynamic>? pastTypes;
  final Species? species;
  final Sprites? sprites;
  final List<Stat>? stats;
  final List<Type>? types;
  final double? weight;

  const PokemonEntity(
    this.abilities,
    this.baseExperience,
    this.forms,
    this.gameIndices,
    this.height,
    this.heldItems,
    this.id,
    this.isDefault,
    this.locationAreaEncounters,
    this.moves,
    this.name,
    this.order,
    this.pastTypes,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.weight,
  );

  PokemonListItemEntity toItemListEntity() {
    return PokemonListItemEntity(
      id ?? 0,
      "$name",
      "${sprites?.other?.officialArtwork?.frontDefault}",
      "${sprites?.frontDefault}",
      id ?? 0,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      abilities,
      baseExperience,
      forms,
      gameIndices,
      height,
      heldItems,
      id,
      isDefault,
      locationAreaEncounters,
      moves,
      name,
      order,
      pastTypes,
      species,
      sprites,
      stats,
      types,
      weight,
    ];
  }
}
