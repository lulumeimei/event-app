// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

class Promoter extends Equatable {
  static const ID = 'id';
  static const NAME = 'name';
  static const DESCRIPTION = 'description';

  final String id;
  final String name;
  final String description;

  const Promoter({
    required this.id,
    required this.name,
    required this.description,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
      ];

  factory Promoter.fromJson(Map<String, dynamic> map) {
    return Promoter(
      id: map[Promoter.ID],
      name: map[Promoter.NAME],
      description: map[Promoter.DESCRIPTION],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      Promoter.ID: id,
      Promoter.NAME: name,
      Promoter.DESCRIPTION: description,
    };
  }
}
