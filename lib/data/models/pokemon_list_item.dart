import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:pokedex_f/domain/entities/pokemon_list_item_entity.dart';

class PokemonListItem extends Equatable {
  final String? name;
  final String? url;

  const PokemonListItem({this.name, this.url});

  factory PokemonListItem.fromMap(Map<String, dynamic> data) => PokemonListItem(
        name: data['name'] as String?,
        url: data['url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'url': url,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Result].
  factory PokemonListItem.fromJson(String data) {
    return PokemonListItem.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Result] to a JSON string.
  String toJson() => json.encode(toMap());

  PokemonListItem copyWith({
    String? name,
    String? url,
  }) {
    return PokemonListItem(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  PokemonListItemEntity toEntity() {
    int number = 0;
    if (url?.endsWith('/') == true) {
      String? subs = url?.substring(0, (url?.length ?? 0) - 1);
      String? stringNum = subs?.replaceAll(RegExp(r'[^0-9]'), '');
      number = int.tryParse(stringNum ?? "") ?? 0;
    } else {
      String? stringNum = url?.replaceAll(RegExp(r'[^0-9]'), '');
      number = int.tryParse(stringNum ?? "") ?? 0;
    }
    return PokemonListItemEntity(
      number,
      "$name",
      "$url",
      number,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, url];
}
