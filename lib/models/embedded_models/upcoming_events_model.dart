// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

class UpcomingEvents extends Equatable {
  static const TOTAL = 'total';
  static const TICKET_MASTER = 'ticketMaster';

  static const TOTAL_1 = '_total';
  static const TMR = 'tmr';
  static const TICKET_MASTER_1 = 'ticketmaster';

  final int total;
  final int? tmr;
  final int ticketMaster;

  @override
  List<Object?> get props => [
        total,
        tmr,
        ticketMaster,
      ];

  const UpcomingEvents({
    required this.total,
    this.tmr,
    required this.ticketMaster,
  });

  factory UpcomingEvents.fromJson(Map<String, dynamic> map) {
    return UpcomingEvents(
      total: int.parse(map[UpcomingEvents.TOTAL].toString()),
      ticketMaster: int.parse(map[UpcomingEvents.TICKET_MASTER].toString()),
    );
  }

  factory UpcomingEvents.fromAttractionJson(Map<String, dynamic> map) {
    return UpcomingEvents(
      total: int.parse(map[UpcomingEvents.TOTAL_1].toString()),
      tmr: map[UpcomingEvents.TMR] != null
          ? int.parse(map[UpcomingEvents.TMR].toString())
          : null,
      ticketMaster: int.parse(map[UpcomingEvents.TICKET_MASTER_1].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      UpcomingEvents.TOTAL: total,
      UpcomingEvents.TICKET_MASTER: ticketMaster,
    };
  }

  Map<String, dynamic> toJsonAttraction() {
    return {
      UpcomingEvents.TOTAL_1: total,
      UpcomingEvents.TMR: tmr,
      UpcomingEvents.TICKET_MASTER_1: ticketMaster,
    };
  }
}
