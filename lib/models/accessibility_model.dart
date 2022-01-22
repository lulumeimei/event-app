// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

class Accessibility extends Equatable {
  static const TICKET_LIMIT = 'ticketLimit';

  final int? ticketLimit;

  const Accessibility({
    this.ticketLimit,
  });

  @override
  List<Object?> get props => [
        ticketLimit,
      ];

  factory Accessibility.fromJson(Map<String, dynamic> map) {
    return Accessibility(
      ticketLimit: map[Accessibility.TICKET_LIMIT],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      Accessibility.TICKET_LIMIT: ticketLimit,
    };
  }
}
