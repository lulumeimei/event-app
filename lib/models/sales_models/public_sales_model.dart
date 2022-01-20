// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

class PublicSales extends Equatable {
  static const START_DATETIME = 'startDateTime';
  static const END_DATETIME = 'endDateTime';
  static const START_TBD = 'startTBD';
  static const START_TBA = 'startTBA';

  final DateTime startDateTime;
  final DateTime endDateTime;
  final bool startTBD;
  final bool startTBA;

  const PublicSales({
    required this.startDateTime,
    required this.endDateTime,
    required this.startTBD,
    required this.startTBA,
  });

  @override
  List<Object?> get props => [
        startDateTime,
        endDateTime,
        startTBD,
        startTBA,
      ];

  factory PublicSales.fromJson(Map<String, dynamic> map) {
    return PublicSales(
      startDateTime: DateTime.parse(
        map[PublicSales.START_DATETIME],
      ),
      endDateTime: DateTime.parse(map[PublicSales.END_DATETIME]),
      startTBD: map[PublicSales.START_TBD] ?? false,
      startTBA: map[PublicSales.START_TBA] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      PublicSales.START_DATETIME: startDateTime.toIso8601String(),
      PublicSales.END_DATETIME: endDateTime.toIso8601String(),
      PublicSales.START_TBD: startTBD,
      PublicSales.START_TBA: startTBA,
    };
  }
}
