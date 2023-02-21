import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'move.dart';
import 'version_group_detail.dart';

class Move extends Equatable {
  final Move? move;
  final List<VersionGroupDetail>? versionGroupDetails;

  const Move({this.move, this.versionGroupDetails});

  factory Move.fromMap(Map<String, dynamic> data) => Move(
        move: data['move'] == null
            ? null
            : Move.fromMap(data['move'] as Map<String, dynamic>),
        versionGroupDetails: (data['version_group_details'] as List<dynamic>?)
            ?.map((e) => VersionGroupDetail.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'move': move?.toMap(),
        'version_group_details':
            versionGroupDetails?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Move].
  factory Move.fromJson(String data) {
    return Move.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Move] to a JSON string.
  String toJson() => json.encode(toMap());

  Move copyWith({
    Move? move,
    List<VersionGroupDetail>? versionGroupDetails,
  }) {
    return Move(
      move: move ?? this.move,
      versionGroupDetails: versionGroupDetails ?? this.versionGroupDetails,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [move, versionGroupDetails];
}
