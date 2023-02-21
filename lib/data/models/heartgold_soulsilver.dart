import 'dart:convert';

import 'package:equatable/equatable.dart';

class HeartgoldSoulsilver extends Equatable {
  final String? backDefault;
  final dynamic backFemale;
  final String? backShiny;
  final dynamic backShinyFemale;
  final String? frontDefault;
  final dynamic frontFemale;
  final String? frontShiny;
  final dynamic frontShinyFemale;

  const HeartgoldSoulsilver({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  factory HeartgoldSoulsilver.fromMap(Map<String, dynamic> data) {
    return HeartgoldSoulsilver(
      backDefault: data['back_default'] as String?,
      backFemale: data['back_female'] as dynamic,
      backShiny: data['back_shiny'] as String?,
      backShinyFemale: data['back_shiny_female'] as dynamic,
      frontDefault: data['front_default'] as String?,
      frontFemale: data['front_female'] as dynamic,
      frontShiny: data['front_shiny'] as String?,
      frontShinyFemale: data['front_shiny_female'] as dynamic,
    );
  }

  Map<String, dynamic> toMap() => {
        'back_default': backDefault,
        'back_female': backFemale,
        'back_shiny': backShiny,
        'back_shiny_female': backShinyFemale,
        'front_default': frontDefault,
        'front_female': frontFemale,
        'front_shiny': frontShiny,
        'front_shiny_female': frontShinyFemale,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [HeartgoldSoulsilver].
  factory HeartgoldSoulsilver.fromJson(String data) {
    return HeartgoldSoulsilver.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [HeartgoldSoulsilver] to a JSON string.
  String toJson() => json.encode(toMap());

  HeartgoldSoulsilver copyWith({
    String? backDefault,
    dynamic backFemale,
    String? backShiny,
    dynamic backShinyFemale,
    String? frontDefault,
    dynamic frontFemale,
    String? frontShiny,
    dynamic frontShinyFemale,
  }) {
    return HeartgoldSoulsilver(
      backDefault: backDefault ?? this.backDefault,
      backFemale: backFemale ?? this.backFemale,
      backShiny: backShiny ?? this.backShiny,
      backShinyFemale: backShinyFemale ?? this.backShinyFemale,
      frontDefault: frontDefault ?? this.frontDefault,
      frontFemale: frontFemale ?? this.frontFemale,
      frontShiny: frontShiny ?? this.frontShiny,
      frontShinyFemale: frontShinyFemale ?? this.frontShinyFemale,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      backDefault,
      backFemale,
      backShiny,
      backShinyFemale,
      frontDefault,
      frontFemale,
      frontShiny,
      frontShinyFemale,
    ];
  }
}
