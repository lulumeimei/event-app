// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

class DMas extends Equatable {
  static const ID = 'id';

  final int id;

  @override
  List<Object?> get props => [
        id,
      ];

  const DMas({
    required this.id,
  });

  factory DMas.fromJson(Map<String, dynamic> map) {
    return DMas(
      id: map[DMas.ID],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      DMas.ID: id,
    };
  }
}
