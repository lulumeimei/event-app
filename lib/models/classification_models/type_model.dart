// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

class Type extends Equatable {
  static const ID = 'id';
  static const NAME = 'name';

  final String id;
  final String name;

  const Type({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  factory Type.fromJson(Map<String, dynamic> map) {
    return Type(
      id: map[Type.ID],
      name: map[Type.NAME] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      Type.ID: id,
      Type.NAME: name,
    };
  }
}
