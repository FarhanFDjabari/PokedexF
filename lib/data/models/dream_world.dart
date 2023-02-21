import 'dart:convert';

import 'package:equatable/equatable.dart';

class DreamWorld extends Equatable {
  final String? frontDefault;
  final dynamic frontFemale;

  const DreamWorld({this.frontDefault, this.frontFemale});

  factory DreamWorld.fromMap(Map<String, dynamic> data) => DreamWorld(
        frontDefault: data['front_default'] as String?,
        frontFemale: data['front_female'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'front_default': frontDefault,
        'front_female': frontFemale,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DreamWorld].
  factory DreamWorld.fromJson(String data) {
    return DreamWorld.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DreamWorld] to a JSON string.
  String toJson() => json.encode(toMap());

  DreamWorld copyWith({
    String? frontDefault,
    dynamic frontFemale,
  }) {
    return DreamWorld(
      frontDefault: frontDefault ?? this.frontDefault,
      frontFemale: frontFemale ?? this.frontFemale,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [frontDefault, frontFemale];
}
