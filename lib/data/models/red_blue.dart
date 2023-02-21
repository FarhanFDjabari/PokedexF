import 'dart:convert';

import 'package:equatable/equatable.dart';

class RedBlue extends Equatable {
  final String? backDefault;
  final String? backGray;
  final String? backTransparent;
  final String? frontDefault;
  final String? frontGray;
  final String? frontTransparent;

  const RedBlue({
    this.backDefault,
    this.backGray,
    this.backTransparent,
    this.frontDefault,
    this.frontGray,
    this.frontTransparent,
  });

  factory RedBlue.fromMap(Map<String, dynamic> data) => RedBlue(
        backDefault: data['back_default'] as String?,
        backGray: data['back_gray'] as String?,
        backTransparent: data['back_transparent'] as String?,
        frontDefault: data['front_default'] as String?,
        frontGray: data['front_gray'] as String?,
        frontTransparent: data['front_transparent'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'back_default': backDefault,
        'back_gray': backGray,
        'back_transparent': backTransparent,
        'front_default': frontDefault,
        'front_gray': frontGray,
        'front_transparent': frontTransparent,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RedBlue].
  factory RedBlue.fromJson(String data) {
    return RedBlue.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RedBlue] to a JSON string.
  String toJson() => json.encode(toMap());

  RedBlue copyWith({
    String? backDefault,
    String? backGray,
    String? backTransparent,
    String? frontDefault,
    String? frontGray,
    String? frontTransparent,
  }) {
    return RedBlue(
      backDefault: backDefault ?? this.backDefault,
      backGray: backGray ?? this.backGray,
      backTransparent: backTransparent ?? this.backTransparent,
      frontDefault: frontDefault ?? this.frontDefault,
      frontGray: frontGray ?? this.frontGray,
      frontTransparent: frontTransparent ?? this.frontTransparent,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      backDefault,
      backGray,
      backTransparent,
      frontDefault,
      frontGray,
      frontTransparent,
    ];
  }
}
