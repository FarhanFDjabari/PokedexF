import 'dart:convert';

import 'package:equatable/equatable.dart';

class Gold extends Equatable {
  final String? backDefault;
  final String? backShiny;
  final String? frontDefault;
  final String? frontShiny;
  final String? frontTransparent;

  const Gold({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
    this.frontTransparent,
  });

  factory Gold.fromMap(Map<String, dynamic> data) => Gold(
        backDefault: data['back_default'] as String?,
        backShiny: data['back_shiny'] as String?,
        frontDefault: data['front_default'] as String?,
        frontShiny: data['front_shiny'] as String?,
        frontTransparent: data['front_transparent'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'back_default': backDefault,
        'back_shiny': backShiny,
        'front_default': frontDefault,
        'front_shiny': frontShiny,
        'front_transparent': frontTransparent,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Gold].
  factory Gold.fromJson(String data) {
    return Gold.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Gold] to a JSON string.
  String toJson() => json.encode(toMap());

  Gold copyWith({
    String? backDefault,
    String? backShiny,
    String? frontDefault,
    String? frontShiny,
    String? frontTransparent,
  }) {
    return Gold(
      backDefault: backDefault ?? this.backDefault,
      backShiny: backShiny ?? this.backShiny,
      frontDefault: frontDefault ?? this.frontDefault,
      frontShiny: frontShiny ?? this.frontShiny,
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
      frontDefault,
      frontShiny,
      frontTransparent,
    ];
  }
}
