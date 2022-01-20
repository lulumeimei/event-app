// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

class HealthCheck extends Equatable {
  static const SUMMARY = 'summary';
  static const DESCRIPTION = 'description';
  static const LEARN_MORE_URL = 'learMoreUrl';

  final String summary;
  final String description;
  final String learnMoreUrl;

  @override
  List<Object?> get props => [
        summary,
        description,
        learnMoreUrl,
      ];

  const HealthCheck({
    required this.summary,
    required this.description,
    required this.learnMoreUrl,
  });

  factory HealthCheck.fromJson(Map<String, dynamic> map) {
    return HealthCheck(
      summary: map[HealthCheck.SUMMARY],
      description: map[HealthCheck.DESCRIPTION],
      learnMoreUrl: map[HealthCheck.LEARN_MORE_URL],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      HealthCheck.SUMMARY: summary,
      HealthCheck.DESCRIPTION: description,
      HealthCheck.LEARN_MORE_URL: learnMoreUrl,
    };
  }
}
