// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

class SubGenre extends Equatable {
  static const ID = 'id';
  static const NAME = 'name';

  final String id;
  final String name;

  const SubGenre({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  factory SubGenre.fromJson(Map<String, dynamic> map) {
    return SubGenre(
      id: map[SubGenre.ID],
      name: map[SubGenre.NAME] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      SubGenre.ID: id,
      SubGenre.NAME: name,
    };
  }
}
