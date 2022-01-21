// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:ticketapp/models/index.dart';

class Embedded extends Equatable {
  static const VENUES = 'venues';
  static const ATTRACTIONS = 'attractions';

  final List<Venue> venues;
  final List<Attraction> attractions;

  const Embedded({
    required this.venues,
    required this.attractions,
  });

  @override
  List<Object?> get props => [
        venues,
        attractions,
      ];

  factory Embedded.fromJson(Map<String, dynamic> map) {
    List<Venue> venues = [];
    for (Map<String, dynamic> venueMap in map[Embedded.VENUES] ?? []) {
      Venue venue = Venue.fromJson(venueMap);
      venues.add(venue);
    }

    List<Attraction> attractions = [];
    for (Map<String, dynamic> attractionMap
        in map[Embedded.ATTRACTIONS] ?? []) {
      Attraction attraction = Attraction.fromJson(attractionMap);
      attractions.add(attraction);
    }
    return Embedded(
      venues: venues,
      attractions: attractions,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      Embedded.VENUES: venues
          .map(
            (e) => e.toJson(),
          )
          .toList(),
      Embedded.ATTRACTIONS: attractions
          .map(
            (e) => e.toJson(),
          )
          .toList(),
    };
  }
}
