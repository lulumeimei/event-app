// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

class SafeTix extends Equatable {
  static const ENABLED = 'enabled';

  final bool enabled;

  const SafeTix({
    required this.enabled,
  });

  @override
  List<Object?> get props => [
        enabled,
      ];

  factory SafeTix.fromJson(Map<String, dynamic> map) {
    return SafeTix(
      enabled: map[SafeTix.ENABLED] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      SafeTix.ENABLED: enabled,
    };
  }
}
