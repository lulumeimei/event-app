// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:ticketapp/models/index.dart';

class Ticketing extends Equatable {
  static const HEALTH_CHECK = 'healthCheck';
  static const SAFE_TIX = 'safeTix';

  final HealthCheck healthCheck;
  final SafeTix safeTix;

  const Ticketing({
    required this.healthCheck,
    required this.safeTix,
  });

  @override
  List<Object?> get props => [
        healthCheck,
        safeTix,
      ];

  factory Ticketing.fromJson(Map<String, dynamic> map) {
    return Ticketing(
      healthCheck: HealthCheck.fromJson(map[Ticketing.HEALTH_CHECK]),
      safeTix: SafeTix.fromJson(map[Ticketing.SAFE_TIX]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      Ticketing.HEALTH_CHECK: healthCheck.toJson(),
      Ticketing.SAFE_TIX: safeTix.toJson(),
    };
  }
}
