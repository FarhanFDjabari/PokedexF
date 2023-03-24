import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'type_x.dart';

class Type extends Equatable {
  final int? slot;
  final TypeX? type;

  const Type({this.slot, this.type});

  factory Type.fromMap(Map<String, dynamic> data) => Type(
        slot: data['slot'] as int?,
        type: data['type'] == null
            ? null
            : TypeX.fromJson(data['type'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'slot': slot,
        'type': type?.toJson(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Type].
  factory Type.fromJson(String data) {
    return Type.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Type] to a JSON string.
  String toJson() => json.encode(toMap());

  Type copyWith({
    int? slot,
    TypeX? type,
  }) {
    return Type(
      slot: slot ?? this.slot,
      type: type ?? this.type,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [slot, type];
}
