import 'dart:convert';

import 'package:equatable/equatable.dart';

class RubySapphire extends Equatable {
  final String? backDefault;
  final String? backShiny;
  final String? frontDefault;
  final String? frontShiny;

  const RubySapphire({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
  });

  factory RubySapphire.fromMap(Map<String, dynamic> data) => RubySapphire(
        backDefault: data['back_default'] as String?,
        backShiny: data['back_shiny'] as String?,
        frontDefault: data['front_default'] as String?,
        frontShiny: data['front_shiny'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'back_default': backDefault,
        'back_shiny': backShiny,
        'front_default': frontDefault,
        'front_shiny': frontShiny,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RubySapphire].
  factory RubySapphire.fromJson(String data) {
    return RubySapphire.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RubySapphire] to a JSON string.
  String toJson() => json.encode(toMap());

  RubySapphire copyWith({
    String? backDefault,
    String? backShiny,
    String? frontDefault,
    String? frontShiny,
  }) {
    return RubySapphire(
      backDefault: backDefault ?? this.backDefault,
      backShiny: backShiny ?? this.backShiny,
      frontDefault: frontDefault ?? this.frontDefault,
      frontShiny: frontShiny ?? this.frontShiny,
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
    ];
  }
}
