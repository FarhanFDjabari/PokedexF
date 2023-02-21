import 'dart:convert';

import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final String? name;
  final String? url;

  const Item({this.name, this.url});

  factory Item.fromMap(Map<String, dynamic> data) => Item(
        name: data['name'] as String?,
        url: data['url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'url': url,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Item].
  factory Item.fromJson(String data) {
    return Item.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Item] to a JSON string.
  String toJson() => json.encode(toMap());

  Item copyWith({
    String? name,
    String? url,
  }) {
    return Item(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, url];
}
