// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

class SubType extends Equatable {
  static const ID = 'id';
  static const NAME = 'name';

  final String id;
  final String name;

  const SubType({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  factory SubType.fromJson(Map<String, dynamic> map) {
    return SubType(
      id: map[SubType.ID],
      name: map[SubType.NAME] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      SubType.ID: id,
      SubType.NAME: name,
    };
  }
}
