import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'emerald.dart';
import 'firered_leafgreen.dart';
import 'ruby_sapphire.dart';

class GenerationIii extends Equatable {
  final Emerald? emerald;
  final FireredLeafgreen? fireredLeafgreen;
  final RubySapphire? rubySapphire;

  const GenerationIii({
    this.emerald,
    this.fireredLeafgreen,
    this.rubySapphire,
  });

  factory GenerationIii.fromMap(Map<String, dynamic> data) => GenerationIii(
        emerald: data['emerald'] == null
            ? null
            : Emerald.fromMap(data['emerald'] as Map<String, dynamic>),
        fireredLeafgreen: data['firered-leafgreen'] == null
            ? null
            : FireredLeafgreen.fromMap(
                data['firered-leafgreen'] as Map<String, dynamic>),
        rubySapphire: data['ruby-sapphire'] == null
            ? null
            : RubySapphire.fromMap(
                data['ruby-sapphire'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'emerald': emerald?.toMap(),
        'firered-leafgreen': fireredLeafgreen?.toMap(),
        'ruby-sapphire': rubySapphire?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GenerationIii].
  factory GenerationIii.fromJson(String data) {
    return GenerationIii.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GenerationIii] to a JSON string.
  String toJson() => json.encode(toMap());

  GenerationIii copyWith({
    Emerald? emerald,
    FireredLeafgreen? fireredLeafgreen,
    RubySapphire? rubySapphire,
  }) {
    return GenerationIii(
      emerald: emerald ?? this.emerald,
      fireredLeafgreen: fireredLeafgreen ?? this.fireredLeafgreen,
      rubySapphire: rubySapphire ?? this.rubySapphire,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [emerald, fireredLeafgreen, rubySapphire];
}
