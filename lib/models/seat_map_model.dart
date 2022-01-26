// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

class SeatMap extends Equatable {
  static const STATIC_URL = 'staticUrl';

  final String staticUrl;

  const SeatMap({
    required this.staticUrl,
  });

  @override
  List<Object?> get props => [
        staticUrl,
      ];

  factory SeatMap.fromJson(Map<String, dynamic> map) {
    return SeatMap(
      staticUrl: map[SeatMap.STATIC_URL],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      SeatMap.STATIC_URL: staticUrl,
    };
  }
}
