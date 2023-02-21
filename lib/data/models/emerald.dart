import 'dart:convert';

import 'package:equatable/equatable.dart';

class Emerald extends Equatable {
  final String? frontDefault;
  final String? frontShiny;

  const Emerald({this.frontDefault, this.frontShiny});

  factory Emerald.fromMap(Map<String, dynamic> data) => Emerald(
        frontDefault: data['front_default'] as String?,
        frontShiny: data['front_shiny'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'front_default': frontDefault,
        'front_shiny': frontShiny,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Emerald].
  factory Emerald.fromJson(String data) {
    return Emerald.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Emerald] to a JSON string.
  String toJson() => json.encode(toMap());

  Emerald copyWith({
    String? frontDefault,
    String? frontShiny,
  }) {
    return Emerald(
      frontDefault: frontDefault ?? this.frontDefault,
      frontShiny: frontShiny ?? this.frontShiny,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [frontDefault, frontShiny];
}
