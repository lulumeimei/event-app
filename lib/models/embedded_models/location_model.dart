// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

class Location extends Equatable {
  static const LONGITUDE = 'longitude';
  static const LATITUDE = 'latitude';

  final double longitude;
  final double latitude;

  @override
  List<Object?> get props => [
        longitude,
        latitude,
      ];

  const Location({
    required this.longitude,
    required this.latitude,
  });

  factory Location.fromJson(Map<String, dynamic> map) {
    return Location(
      longitude: double.parse(map[Location.LONGITUDE].toString()),
      latitude: double.parse(map[Location.LATITUDE].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      Location.LONGITUDE: longitude,
      Location.LATITUDE: latitude,
    };
  }
}
