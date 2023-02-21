import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'omegaruby_alphasapphire.dart';
import 'xy.dart';

class GenerationVi extends Equatable {
  final OmegarubyAlphasapphire? omegarubyAlphasapphire;
  final Xy? xY;

  const GenerationVi({this.omegarubyAlphasapphire, this.xY});

  factory GenerationVi.fromMap(Map<String, dynamic> data) => GenerationVi(
        omegarubyAlphasapphire: data['omegaruby-alphasapphire'] == null
            ? null
            : OmegarubyAlphasapphire.fromMap(
                data['omegaruby-alphasapphire'] as Map<String, dynamic>),
        xY: data['x-y'] == null
            ? null
            : Xy.fromMap(data['x-y'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'omegaruby-alphasapphire': omegarubyAlphasapphire?.toMap(),
        'x-y': xY?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GenerationVi].
  factory GenerationVi.fromJson(String data) {
    return GenerationVi.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GenerationVi] to a JSON string.
  String toJson() => json.encode(toMap());

  GenerationVi copyWith({
    OmegarubyAlphasapphire? omegarubyAlphasapphire,
    Xy? xY,
  }) {
    return GenerationVi(
      omegarubyAlphasapphire:
          omegarubyAlphasapphire ?? this.omegarubyAlphasapphire,
      xY: xY ?? this.xY,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [omegarubyAlphasapphire, xY];
}
