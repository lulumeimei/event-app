// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

class Segment extends Equatable {
  static const ID = 'id';
  static const NAME = 'name';

  final String id;
  final String name;

  const Segment({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  factory Segment.fromJson(Map<String, dynamic> map) {
    return Segment(
      id: map[Segment.ID],
      name: map[Segment.NAME] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      Segment.ID: id,
      Segment.NAME: name,
    };
  }
}
