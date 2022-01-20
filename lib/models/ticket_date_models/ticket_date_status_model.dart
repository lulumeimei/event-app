// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

class TicketDateStatus extends Equatable {
  static const CODE = 'code';

  final String code;

  const TicketDateStatus({
    required this.code,
  });

  @override
  List<Object?> get props => [
        code,
      ];

  factory TicketDateStatus.fromJson(Map<String, dynamic> map) {
    return TicketDateStatus(
      code: map[TicketDateStatus.CODE] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      TicketDateStatus.CODE: code,
    };
  }
}
