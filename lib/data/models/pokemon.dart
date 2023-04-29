import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:pokedex_f/domain/entities/pokemon_entity.dart';

import 'ability.dart';
import 'form.dart';
import 'game_index.dart';
import 'held_item.dart';
import 'move.dart';
import 'species.dart';
import 'sprites.dart';
import 'stat.dart';
import 'type.dart';

class Pokemon extends Equatable {
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

  const Pokemon({
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
  });

  factory Pokemon.fromJson(Map<String, dynamic> data) => Pokemon(
        abilities: (data['abilities'] as List<dynamic>?)
            ?.map((e) => Ability.fromMap(e as Map<String, dynamic>))
            .toList(),
        baseExperience: data['base_experience'] as int?,
        forms: (data['forms'] as List<dynamic>?)
            ?.map((e) => Form.fromMap(e as Map<String, dynamic>))
            .toList(),
        gameIndices: (data['game_indices'] as List<dynamic>?)
            ?.map((e) => GameIndex.fromMap(e as Map<String, dynamic>))
            .toList(),
        height: data['height'] is int
            ? (data['height'] as int?)?.toDouble()
            : data['height'] as double?,
        heldItems: (data['held_items'] as List<dynamic>?)
            ?.map((e) => HeldItem.fromMap(e as Map<String, dynamic>))
            .toList(),
        id: data['id'] as int?,
        isDefault: data['is_default'] as bool?,
        locationAreaEncounters: data['location_area_encounters'] as String?,
        moves: (data['moves'] as List<dynamic>?)
            ?.map((e) => Move.fromMap(e as Map<String, dynamic>))
            .toList(),
        name: data['name'] as String?,
        order: data['order'] as int?,
        pastTypes: data['past_types'] as List<dynamic>?,
        species: data['species'] == null
            ? null
            : Species.fromMap(data['species'] as Map<String, dynamic>),
        sprites: data['sprites'] == null
            ? null
            : Sprites.fromMap(data['sprites'] as Map<String, dynamic>),
        stats: (data['stats'] as List<dynamic>?)
            ?.map((e) => Stat.fromMap(e as Map<String, dynamic>))
            .toList(),
        types: (data['types'] as List<dynamic>?)
            ?.map((e) => Type.fromMap(e as Map<String, dynamic>))
            .toList(),
        weight: data['weight'] is int
            ? (data['weight'] as int?)?.toDouble()
            : data['weight'] as double?,
      );

  Map<String, dynamic> toMap() => {
        'abilities': abilities?.map((e) => e.toMap()).toList(),
        'base_experience': baseExperience,
        'forms': forms?.map((e) => e.toMap()).toList(),
        'game_indices': gameIndices?.map((e) => e.toMap()).toList(),
        'height': height,
        'held_items': heldItems?.map((e) => e.toMap()).toList(),
        'id': id,
        'is_default': isDefault,
        'location_area_encounters': locationAreaEncounters,
        'moves': moves?.map((e) => e.toMap()).toList(),
        'name': name,
        'order': order,
        'past_types': pastTypes,
        'species': species?.toMap(),
        'sprites': sprites?.toMap(),
        'stats': stats?.map((e) => e.toMap()).toList(),
        'types': types?.map((e) => e.toMap()).toList(),
        'weight': weight,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Pokemon].

  /// `dart:convert`
  ///
  /// Converts [Pokemon] to a JSON string.
  String toJson() => json.encode(toMap());

  Pokemon copyWith({
    List<Ability>? abilities,
    int? baseExperience,
    List<Form>? forms,
    List<GameIndex>? gameIndices,
    double? height,
    List<HeldItem>? heldItems,
    int? id,
    bool? isDefault,
    String? locationAreaEncounters,
    List<Move>? moves,
    String? name,
    int? order,
    List<dynamic>? pastTypes,
    Species? species,
    Sprites? sprites,
    List<Stat>? stats,
    List<Type>? types,
    double? weight,
  }) {
    return Pokemon(
      abilities: abilities ?? this.abilities,
      baseExperience: baseExperience ?? this.baseExperience,
      forms: forms ?? this.forms,
      gameIndices: gameIndices ?? this.gameIndices,
      height: height ?? this.height,
      heldItems: heldItems ?? this.heldItems,
      id: id ?? this.id,
      isDefault: isDefault ?? this.isDefault,
      locationAreaEncounters:
          locationAreaEncounters ?? this.locationAreaEncounters,
      moves: moves ?? this.moves,
      name: name ?? this.name,
      order: order ?? this.order,
      pastTypes: pastTypes ?? this.pastTypes,
      species: species ?? this.species,
      sprites: sprites ?? this.sprites,
      stats: stats ?? this.stats,
      types: types ?? this.types,
      weight: weight ?? this.weight,
    );
  }

  PokemonEntity toEntity() {
    return PokemonEntity(
      abilities: abilities,
      baseExperience: baseExperience,
      forms: forms,
      gameIndices: gameIndices,
      height: height,
      heldItems: heldItems,
      id: id,
      isDefault: isDefault,
      locationAreaEncounters: locationAreaEncounters,
      moves: moves,
      name: name,
      order: order,
      pastTypes: pastTypes,
      species: species,
      sprites: sprites,
      stats: stats,
      types: types,
      weight: weight,
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
