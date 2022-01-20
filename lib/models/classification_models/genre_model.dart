// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

class Genre extends Equatable {
  static const ID = 'id';
  static const NAME = 'name';

  final String id;
  final String name;

  const Genre({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  factory Genre.fromJson(Map<String, dynamic> map) {
    return Genre(
      id: map[Genre.ID],
      name: map[Genre.NAME] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      Genre.ID: id,
      Genre.NAME: name,
    };
  }
}
