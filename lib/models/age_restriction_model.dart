// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

class AgeRestriction extends Equatable {
  static const LEGAL_AGE_ENFORCED = 'legalAgeEnforced';

  final bool legalAgeEnforced;

  const AgeRestriction({
    required this.legalAgeEnforced,
  });

  @override
  List<Object?> get props => [
        legalAgeEnforced,
      ];

  factory AgeRestriction.fromJson(Map<String, dynamic> map) {
    return AgeRestriction(
      legalAgeEnforced: map[AgeRestriction.LEGAL_AGE_ENFORCED],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      AgeRestriction.LEGAL_AGE_ENFORCED: legalAgeEnforced,
    };
  }
}
