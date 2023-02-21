import 'dart:convert';

import 'package:equatable/equatable.dart';

class Species extends Equatable {
  final String? name;
  final String? url;

  const Species({this.name, this.url});

  factory Species.fromMap(Map<String, dynamic> data) => Species(
        name: data['name'] as String?,
        url: data['url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'url': url,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Species].
  factory Species.fromJson(String data) {
    return Species.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Species] to a JSON string.
  String toJson() => json.encode(toMap());

  Species copyWith({
    String? name,
    String? url,
  }) {
    return Species(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, url];
}
