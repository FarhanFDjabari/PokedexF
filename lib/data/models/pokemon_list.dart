import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'pokemon_list_item.dart';

class PokemonList extends Equatable {
  final int? count;
  final String? next;
  final dynamic previous;
  final List<PokemonListItem>? results;

  const PokemonList({this.count, this.next, this.previous, this.results});

  factory PokemonList.fromMap(Map<String, dynamic> data) => PokemonList(
        count: data['count'] as int?,
        next: data['next'] as String?,
        previous: data['previous'] as dynamic,
        results: (data['results'] as List<dynamic>?)
            ?.map((e) => PokemonListItem.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'count': count,
        'next': next,
        'previous': previous,
        'results': results?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PokemonList].
  factory PokemonList.fromJson(Map<String, dynamic> data) => PokemonList(
        count: data['count'] as int?,
        next: data['next'] as String?,
        previous: data['previous'] as dynamic,
        results: (data['results'] as List<dynamic>?)
            ?.map((e) => PokemonListItem.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  /// `dart:convert`
  ///
  /// Converts [PokemonList] to a JSON string.
  String toJson() => json.encode(toMap());

  PokemonList copyWith({
    int? count,
    String? next,
    dynamic previous,
    List<PokemonListItem>? results,
  }) {
    return PokemonList(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      results: results ?? this.results,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [count, next, previous, results];
}
