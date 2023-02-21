import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'icons.dart';

class GenerationViii extends Equatable {
  final Icons? icons;

  const GenerationViii({this.icons});

  factory GenerationViii.fromMap(Map<String, dynamic> data) {
    return GenerationViii(
      icons: data['icons'] == null
          ? null
          : Icons.fromMap(data['icons'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'icons': icons?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GenerationViii].
  factory GenerationViii.fromJson(String data) {
    return GenerationViii.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GenerationViii] to a JSON string.
  String toJson() => json.encode(toMap());

  GenerationViii copyWith({
    Icons? icons,
  }) {
    return GenerationViii(
      icons: icons ?? this.icons,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [icons];
}
