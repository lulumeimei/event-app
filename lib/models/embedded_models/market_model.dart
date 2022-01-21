// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

class Market extends Equatable {
  static const NAME = 'name';
  static const ID = 'id';

  final String name;
  final String id;

  @override
  List<Object?> get props => [
        name,
        id,
      ];

  const Market({
    required this.name,
    required this.id,
  });

  factory Market.fromJson(Map<String, dynamic> map) {
    return Market(
      name: map[Market.NAME],
      id: map[Market.ID],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      Market.NAME: name,
      Market.ID: id,
    };
  }
}
