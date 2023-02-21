import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'diamond_pearl.dart';
import 'heartgold_soulsilver.dart';
import 'platinum.dart';

class GenerationIv extends Equatable {
  final DiamondPearl? diamondPearl;
  final HeartgoldSoulsilver? heartgoldSoulsilver;
  final Platinum? platinum;

  const GenerationIv({
    this.diamondPearl,
    this.heartgoldSoulsilver,
    this.platinum,
  });

  factory GenerationIv.fromMap(Map<String, dynamic> data) => GenerationIv(
        diamondPearl: data['diamond-pearl'] == null
            ? null
            : DiamondPearl.fromMap(
                data['diamond-pearl'] as Map<String, dynamic>),
        heartgoldSoulsilver: data['heartgold-soulsilver'] == null
            ? null
            : HeartgoldSoulsilver.fromMap(
                data['heartgold-soulsilver'] as Map<String, dynamic>),
        platinum: data['platinum'] == null
            ? null
            : Platinum.fromMap(data['platinum'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'diamond-pearl': diamondPearl?.toMap(),
        'heartgold-soulsilver': heartgoldSoulsilver?.toMap(),
        'platinum': platinum?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GenerationIv].
  factory GenerationIv.fromJson(String data) {
    return GenerationIv.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GenerationIv] to a JSON string.
  String toJson() => json.encode(toMap());

  GenerationIv copyWith({
    DiamondPearl? diamondPearl,
    HeartgoldSoulsilver? heartgoldSoulsilver,
    Platinum? platinum,
  }) {
    return GenerationIv(
      diamondPearl: diamondPearl ?? this.diamondPearl,
      heartgoldSoulsilver: heartgoldSoulsilver ?? this.heartgoldSoulsilver,
      platinum: platinum ?? this.platinum,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      diamondPearl,
      heartgoldSoulsilver,
      platinum,
    ];
  }
}
