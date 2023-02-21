import 'dart:convert';

import 'package:equatable/equatable.dart';

class Form extends Equatable {
  final String? name;
  final String? url;

  const Form({this.name, this.url});

  factory Form.fromMap(Map<String, dynamic> data) => Form(
        name: data['name'] as String?,
        url: data['url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'url': url,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Form].
  factory Form.fromJson(String data) {
    return Form.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Form] to a JSON string.
  String toJson() => json.encode(toMap());

  Form copyWith({
    String? name,
    String? url,
  }) {
    return Form(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, url];
}
