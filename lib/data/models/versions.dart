import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'generation_i.dart';
import 'generation_ii.dart';
import 'generation_iii.dart';
import 'generation_iv.dart';
import 'generation_v.dart';
import 'generation_vi.dart';
import 'generation_vii.dart';
import 'generation_viii.dart';

class Versions extends Equatable {
  final GenerationI? generationI;
  final GenerationIi? generationIi;
  final GenerationIii? generationIii;
  final GenerationIv? generationIv;
  final GenerationV? generationV;
  final GenerationVi? generationVi;
  final GenerationVii? generationVii;
  final GenerationViii? generationViii;

  const Versions({
    this.generationI,
    this.generationIi,
    this.generationIii,
    this.generationIv,
    this.generationV,
    this.generationVi,
    this.generationVii,
    this.generationViii,
  });

  factory Versions.fromMap(Map<String, dynamic> data) => Versions(
        generationI: data['generation-i'] == null
            ? null
            : GenerationI.fromMap(data['generation-i'] as Map<String, dynamic>),
        generationIi: data['generation-ii'] == null
            ? null
            : GenerationIi.fromMap(
                data['generation-ii'] as Map<String, dynamic>),
        generationIii: data['generation-iii'] == null
            ? null
            : GenerationIii.fromMap(
                data['generation-iii'] as Map<String, dynamic>),
        generationIv: data['generation-iv'] == null
            ? null
            : GenerationIv.fromMap(
                data['generation-iv'] as Map<String, dynamic>),
        generationV: data['generation-v'] == null
            ? null
            : GenerationV.fromMap(data['generation-v'] as Map<String, dynamic>),
        generationVi: data['generation-vi'] == null
            ? null
            : GenerationVi.fromMap(
                data['generation-vi'] as Map<String, dynamic>),
        generationVii: data['generation-vii'] == null
            ? null
            : GenerationVii.fromMap(
                data['generation-vii'] as Map<String, dynamic>),
        generationViii: data['generation-viii'] == null
            ? null
            : GenerationViii.fromMap(
                data['generation-viii'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'generation-i': generationI?.toMap(),
        'generation-ii': generationIi?.toMap(),
        'generation-iii': generationIii?.toMap(),
        'generation-iv': generationIv?.toMap(),
        'generation-v': generationV?.toMap(),
        'generation-vi': generationVi?.toMap(),
        'generation-vii': generationVii?.toMap(),
        'generation-viii': generationViii?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Versions].
  factory Versions.fromJson(String data) {
    return Versions.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Versions] to a JSON string.
  String toJson() => json.encode(toMap());

  Versions copyWith({
    GenerationI? generationI,
    GenerationIi? generationIi,
    GenerationIii? generationIii,
    GenerationIv? generationIv,
    GenerationV? generationV,
    GenerationVi? generationVi,
    GenerationVii? generationVii,
    GenerationViii? generationViii,
  }) {
    return Versions(
      generationI: generationI ?? this.generationI,
      generationIi: generationIi ?? this.generationIi,
      generationIii: generationIii ?? this.generationIii,
      generationIv: generationIv ?? this.generationIv,
      generationV: generationV ?? this.generationV,
      generationVi: generationVi ?? this.generationVi,
      generationVii: generationVii ?? this.generationVii,
      generationViii: generationViii ?? this.generationViii,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      generationI,
      generationIi,
      generationIii,
      generationIv,
      generationV,
      generationVi,
      generationVii,
      generationViii,
    ];
  }
}
