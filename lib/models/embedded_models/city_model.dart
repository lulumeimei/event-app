// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

class City extends Equatable {
  static const NAME = 'name';

  final String name;

  @override
  List<Object?> get props => [
        name,
      ];

  const City({
    required this.name,
  });

  factory City.fromJson(Map<String, dynamic> map) {
    return City(
      name: map[City.NAME],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      City.NAME: name,
    };
  }
}
