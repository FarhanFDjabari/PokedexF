import 'dart:convert';

import 'package:equatable/equatable.dart';

class FireredLeafgreen extends Equatable {
  final String? backDefault;
  final String? backShiny;
  final String? frontDefault;
  final String? frontShiny;

  const FireredLeafgreen({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
  });

  factory FireredLeafgreen.fromMap(Map<String, dynamic> data) {
    return FireredLeafgreen(
      backDefault: data['back_default'] as String?,
      backShiny: data['back_shiny'] as String?,
      frontDefault: data['front_default'] as String?,
      frontShiny: data['front_shiny'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'back_default': backDefault,
        'back_shiny': backShiny,
        'front_default': frontDefault,
        'front_shiny': frontShiny,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [FireredLeafgreen].
  factory FireredLeafgreen.fromJson(String data) {
    return FireredLeafgreen.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [FireredLeafgreen] to a JSON string.
  String toJson() => json.encode(toMap());

  FireredLeafgreen copyWith({
    String? backDefault,
    String? backShiny,
    String? frontDefault,
    String? frontShiny,
  }) {
    return FireredLeafgreen(
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
