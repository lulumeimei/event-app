// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

class TicketLimit extends Equatable {
  static const INFO = 'info';

  final String info;

  const TicketLimit({
    required this.info,
  });

  @override
  List<Object?> get props => [
        info,
      ];

  factory TicketLimit.fromJson(Map<String, dynamic> map) {
    return TicketLimit(
      info: map[TicketLimit.INFO] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      TicketLimit.INFO: info,
    };
  }
}
