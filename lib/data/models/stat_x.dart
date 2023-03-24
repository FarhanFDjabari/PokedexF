import 'package:equatable/equatable.dart';

class StatX extends Equatable {
  final String? name;
  final String? url;

  const StatX({this.name, this.url});

  factory StatX.fromJson(Map<String, dynamic> json) => StatX(
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
