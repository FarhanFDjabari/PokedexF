import 'dart:convert';

import 'package:equatable/equatable.dart';

class Crystal extends Equatable {
  final String? backDefault;
  final String? backShiny;
  final String? backShinyTransparent;
  final String? backTransparent;
  final String? frontDefault;
  final String? frontShiny;
  final String? frontShinyTransparent;
  final String? frontTransparent;

  const Crystal({
    this.backDefault,
    this.backShiny,
    this.backShinyTransparent,
    this.backTransparent,
    this.frontDefault,
    this.frontShiny,
    this.frontShinyTransparent,
    this.frontTransparent,
  });

  factory Crystal.fromMap(Map<String, dynamic> data) => Crystal(
        backDefault: data['back_default'] as String?,
        backShiny: data['back_shiny'] as String?,
        backShinyTransparent: data['back_shiny_transparent'] as String?,
        backTransparent: data['back_transparent'] as String?,
        frontDefault: data['front_default'] as String?,
        frontShiny: data['front_shiny'] as String?,
        frontShinyTransparent: data['front_shiny_transparent'] as String?,
        frontTransparent: data['front_transparent'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'back_default': backDefault,
        'back_shiny': backShiny,
        'back_shiny_transparent': backShinyTransparent,
        'back_transparent': backTransparent,
        'front_default': frontDefault,
        'front_shiny': frontShiny,
        'front_shiny_transparent': frontShinyTransparent,
        'front_transparent': frontTransparent,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Crystal].
  factory Crystal.fromJson(String data) {
    return Crystal.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Crystal] to a JSON string.
  String toJson() => json.encode(toMap());

  Crystal copyWith({
    String? backDefault,
    String? backShiny,
    String? backShinyTransparent,
    String? backTransparent,
    String? frontDefault,
    String? frontShiny,
    String? frontShinyTransparent,
    String? frontTransparent,
  }) {
    return Crystal(
      backDefault: backDefault ?? this.backDefault,
      backShiny: backShiny ?? this.backShiny,
      backShinyTransparent: backShinyTransparent ?? this.backShinyTransparent,
      backTransparent: backTransparent ?? this.backTransparent,
      frontDefault: frontDefault ?? this.frontDefault,
      frontShiny: frontShiny ?? this.frontShiny,
      frontShinyTransparent:
          frontShinyTransparent ?? this.frontShinyTransparent,
      frontTransparent: frontTransparent ?? this.frontTransparent,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      backDefault,
      backShiny,
      backShinyTransparent,
      backTransparent,
      frontDefault,
      frontShiny,
      frontShinyTransparent,
      frontTransparent,
    ];
  }
}
