// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:ticketapp/models/ticket_date_models/index.dart';

class TicketDate extends Equatable {
  static const START = 'start';
  static const TIMEZONE = 'timezone';
  static const STATUS = 'status';
  static const SPAN_MULTIPLE_DAYS = 'spanMultipleDays';

  final TicketDateStart ticketDateStart;
  final TicketDateStatus ticketDateStatus;
  final String timeZone;
  final bool spanMultipleDays;

  const TicketDate({
    required this.ticketDateStart,
    required this.ticketDateStatus,
    required this.timeZone,
    required this.spanMultipleDays,
  });

  @override
  List<Object?> get props => [
        ticketDateStart,
        ticketDateStatus,
        timeZone,
        spanMultipleDays,
      ];

  factory TicketDate.fromJson(Map<String, dynamic> map) {
    return TicketDate(
      ticketDateStart: TicketDateStart.fromJson(map[TicketDate.START]),
      ticketDateStatus: TicketDateStatus.fromJson(map[TicketDate.STATUS]),
      timeZone: map[TicketDate.TIMEZONE],
      spanMultipleDays: map[TicketDate.SPAN_MULTIPLE_DAYS] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      TicketDate.START: ticketDateStatus.toJson(),
      TicketDate.STATUS: ticketDateStatus.toJson(),
      TicketDate.TIMEZONE: timeZone,
      TicketDate.SPAN_MULTIPLE_DAYS: spanMultipleDays,
    };
  }
}
