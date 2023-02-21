import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'item.dart';
import 'version_detail.dart';

class HeldItem extends Equatable {
  final Item? item;
  final List<VersionDetail>? versionDetails;

  const HeldItem({this.item, this.versionDetails});

  factory HeldItem.fromMap(Map<String, dynamic> data) => HeldItem(
        item: data['item'] == null
            ? null
            : Item.fromMap(data['item'] as Map<String, dynamic>),
        versionDetails: (data['version_details'] as List<dynamic>?)
            ?.map((e) => VersionDetail.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'item': item?.toMap(),
        'version_details': versionDetails?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [HeldItem].
  factory HeldItem.fromJson(String data) {
    return HeldItem.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [HeldItem] to a JSON string.
  String toJson() => json.encode(toMap());

  HeldItem copyWith({
    Item? item,
    List<VersionDetail>? versionDetails,
  }) {
    return HeldItem(
      item: item ?? this.item,
      versionDetails: versionDetails ?? this.versionDetails,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [item, versionDetails];
}
