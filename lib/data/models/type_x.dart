import 'package:equatable/equatable.dart';

class TypeX extends Equatable {
  final String? name;
  final String? url;

  const TypeX({this.name, this.url});

  factory TypeX.fromJson(Map<String, dynamic> json) => TypeX(
        name: json['name'] as String?,
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, url];
}
