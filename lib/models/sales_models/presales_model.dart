// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

class PreSale extends Equatable {
  static const START_DATETIME = 'startDateTime';
  static const END_DATETIME = 'endDateTime';
  static const NAME = 'name';

  final DateTime startDateTime;
  final DateTime endDateTime;
  final String name;

  const PreSale({
    required this.startDateTime,
    required this.endDateTime,
    required this.name,
  });

  factory PreSale.fromJson(Map<String, dynamic> map) {
    return PreSale(
      startDateTime: DateTime.parse(map[PreSale.START_DATETIME]),
      endDateTime: DateTime.parse(map[PreSale.END_DATETIME]),
      name: map[PreSale.NAME] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      PreSale.START_DATETIME: startDateTime.toIso8601String(),
      PreSale.END_DATETIME: endDateTime.toIso8601String(),
      PreSale.NAME: name,
    };
  }

  @override
  List<Object?> get props => [
        startDateTime,
        endDateTime,
        name,
      ];
}
