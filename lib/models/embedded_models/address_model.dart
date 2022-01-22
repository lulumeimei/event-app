// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

class Address extends Equatable {
  static const LINE_1 = 'line1';

  final String? line1;

  @override
  List<Object?> get props => [
        line1,
      ];

  const Address({
    this.line1,
  });

  factory Address.fromJson(Map<String, dynamic> map) {
    return Address(
      line1: map[Address.LINE_1],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      Address.LINE_1: line1,
    };
  }
}
