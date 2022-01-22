// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

class GeneralInfo extends Equatable {
  static const GENERAL_RULE = 'generalRule';
  static const CHILD_RULE = 'childRule';

  final String? generalRule;
  final String? childRule;

  const GeneralInfo({
    this.generalRule,
    this.childRule,
  });

  @override
  List<Object?> get props => [
        generalRule,
        childRule,
      ];

  factory GeneralInfo.fromJson(Map<String, dynamic> map) {
    return GeneralInfo(
      generalRule: map[GeneralInfo.GENERAL_RULE],
      childRule: map[GeneralInfo.CHILD_RULE],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      GeneralInfo.GENERAL_RULE: generalRule,
      GeneralInfo.CHILD_RULE: childRule,
    };
  }
}
