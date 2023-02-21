import 'dart:convert';

import 'package:equatable/equatable.dart';

class Icons extends Equatable {
  final String? frontDefault;
  final dynamic frontFemale;

  const Icons({this.frontDefault, this.frontFemale});

  factory Icons.fromMap(Map<String, dynamic> data) => Icons(
        frontDefault: data['front_default'] as String?,
        frontFemale: data['front_female'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'front_default': frontDefault,
        'front_female': frontFemale,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Icons].
  factory Icons.fromJson(String data) {
    return Icons.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Icons] to a JSON string.
  String toJson() => json.encode(toMap());

  Icons copyWith({
    String? frontDefault,
    dynamic frontFemale,
  }) {
    return Icons(
      frontDefault: frontDefault ?? this.frontDefault,
      frontFemale: frontFemale ?? this.frontFemale,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [frontDefault, frontFemale];
}
