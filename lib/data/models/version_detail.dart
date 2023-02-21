import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'version.dart';

class VersionDetail extends Equatable {
  final int? rarity;
  final Version? version;

  const VersionDetail({this.rarity, this.version});

  factory VersionDetail.fromMap(Map<String, dynamic> data) => VersionDetail(
        rarity: data['rarity'] as int?,
        version: data['version'] == null
            ? null
            : Version.fromMap(data['version'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'rarity': rarity,
        'version': version?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [VersionDetail].
  factory VersionDetail.fromJson(String data) {
    return VersionDetail.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [VersionDetail] to a JSON string.
  String toJson() => json.encode(toMap());

  VersionDetail copyWith({
    int? rarity,
    Version? version,
  }) {
    return VersionDetail(
      rarity: rarity ?? this.rarity,
      version: version ?? this.version,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [rarity, version];
}
