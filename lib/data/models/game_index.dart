import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'version.dart';

class GameIndex extends Equatable {
  final int? gameIndex;
  final Version? version;

  const GameIndex({this.gameIndex, this.version});

  factory GameIndex.fromMap(Map<String, dynamic> data) => GameIndex(
        gameIndex: data['game_index'] as int?,
        version: data['version'] == null
            ? null
            : Version.fromMap(data['version'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'game_index': gameIndex,
        'version': version?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GameIndex].
  factory GameIndex.fromJson(String data) {
    return GameIndex.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GameIndex] to a JSON string.
  String toJson() => json.encode(toMap());

  GameIndex copyWith({
    int? gameIndex,
    Version? version,
  }) {
    return GameIndex(
      gameIndex: gameIndex ?? this.gameIndex,
      version: version ?? this.version,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [gameIndex, version];
}
