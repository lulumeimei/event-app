// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

class StateModel extends Equatable {
  static const NAME = 'name';
  static const STATE_CODE = 'stateCode';

  final String name;
  final String stateCode;

  @override
  List<Object?> get props => [
        name,
        stateCode,
      ];

  const StateModel({
    required this.name,
    required this.stateCode,
  });

  factory StateModel.fromJson(Map<String, dynamic> map) {
    return StateModel(
      name: map[StateModel.NAME],
      stateCode: map[StateModel.STATE_CODE],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      StateModel.NAME: name,
      StateModel.STATE_CODE: stateCode,
    };
  }
}
