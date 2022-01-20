// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

class TicketDateStart extends Equatable {
  static const LOCAL_DATE = 'localDate';
  static const LOCAL_TIME = 'localTime';
  static const DATE_TIME = 'dateTime';
  static const DATE_TBD = 'dateTBD';
  static const DATE_TBA = 'dateTBA';
  static const TIME_TBA = 'timeTBA';
  static const NO_SPECIFIC_TIME = 'noSpecificTime';

  final String localDate;
  final String localTime;
  final String dateTime;
  final bool dateTBD;
  final bool dateTBA;
  final bool timeTBA;
  final bool noSpecificTime;

  const TicketDateStart({
    required this.localDate,
    required this.localTime,
    required this.dateTime,
    required this.dateTBD,
    required this.dateTBA,
    required this.timeTBA,
    required this.noSpecificTime,
  });

  @override
  List<Object?> get props => [
        localDate,
        localTime,
        dateTime,
        dateTBD,
        dateTBA,
        timeTBA,
        noSpecificTime,
      ];

  factory TicketDateStart.fromJson(Map<String, dynamic> map) {
    return TicketDateStart(
      localDate: map[TicketDateStart.LOCAL_DATE],
      localTime: map[TicketDateStart.LOCAL_TIME],
      dateTime: map[TicketDateStart.DATE_TIME],
      dateTBD: map[TicketDateStart.DATE_TBD],
      dateTBA: map[TicketDateStart.DATE_TBA],
      timeTBA: map[TicketDateStart.TIME_TBA],
      noSpecificTime: map[TicketDateStart.NO_SPECIFIC_TIME] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      TicketDateStart.LOCAL_DATE: localDate,
      TicketDateStart.LOCAL_TIME: localTime,
      TicketDateStart.DATE_TIME: dateTime,
      TicketDateStart.DATE_TBD: dateTBD,
      TicketDateStart.DATE_TBA: dateTBA,
      TicketDateStart.TIME_TBA: timeTBA,
      TicketDateStart.NO_SPECIFIC_TIME: noSpecificTime,
    };
  }
}
