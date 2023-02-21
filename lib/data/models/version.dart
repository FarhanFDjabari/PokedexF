import 'dart:convert';

import 'package:equatable/equatable.dart';

class Version extends Equatable {
  final String? name;
  final String? url;

  const Version({this.name, this.url});

  factory Version.fromMap(Map<String, dynamic> data) => Version(
        name: data['name'] as String?,
        url: data['url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'url': url,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Version].
  factory Version.fromJson(String data) {
    return Version.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Version] to a JSON string.
  String toJson() => json.encode(toMap());

  Version copyWith({
    String? name,
    String? url,
  }) {
    return Version(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, url];
}
