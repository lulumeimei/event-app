// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:ticketapp/models/index.dart';

class Attraction extends Equatable {
  static const NAME = 'name';
  static const TYPE = 'type';
  static const ID = 'id';
  static const TEST = 'test';
  static const URL = 'url';
  static const LOCALE = 'locale';
  static const EXTERNAL_LINKS = 'externalLinks';
  static const ALIASES = 'aliases';
  static const IMAGES = 'images';
  static const CLASSIFICATIONS = 'classifications';
  static const UPCOMING_EVENTS = 'upcomingEvents';
  static const LINKS = '_links';

  final String name;
  final String type;
  final String id;
  final bool test;
  final String url;
  final String locale;
  final ExternalLinks externalLinks;
  final List<String> aliases;
  final List<TicketImage> images;
  final List<Classification> classifications;
  final UpcomingEvents upcomingEvents;
  final SelfLink selfLink;

  const Attraction({
    required this.name,
    required this.type,
    required this.id,
    required this.test,
    required this.url,
    required this.locale,
    required this.externalLinks,
    required this.aliases,
    required this.images,
    required this.classifications,
    required this.upcomingEvents,
    required this.selfLink,
  });

  @override
  List<Object?> get props => [
        name,
        type,
        id,
        test,
        url,
        locale,
        externalLinks,
        aliases,
        images,
        classifications,
        upcomingEvents,
        selfLink,
      ];

  factory Attraction.fromJson(Map<String, dynamic> map) {
    List<String> aliases = [];
    for (var aliasData in map[Attraction.ALIASES] ?? []) {
      aliases.add(aliasData.toString());
    }
    List<TicketImage> images = [];
    for (Map<String, dynamic> imageMap in map[Attraction.IMAGES] ?? []) {
      TicketImage ticketImage = TicketImage.fromJson(imageMap);
      images.add(ticketImage);
    }

    List<Classification> classifications = [];
    for (Map<String, dynamic> classificationMap
        in map[Attraction.CLASSIFICATIONS] ?? []) {
      Classification classification =
          Classification.fromJson(classificationMap);
      classifications.add(classification);
    }

    return Attraction(
      name: map[Attraction.NAME],
      type: map[Attraction.TYPE],
      id: map[Attraction.ID],
      test: map[Attraction.TEST] ?? false,
      url: map[Attraction.URL],
      locale: map[Attraction.LOCALE],
      externalLinks: ExternalLinks.fromJson(map[Attraction.EXTERNAL_LINKS]),
      aliases: aliases,
      images: images,
      classifications: classifications,
      upcomingEvents:
          UpcomingEvents.fromAttractionJson(map[Attraction.UPCOMING_EVENTS]),
      selfLink: SelfLink.fromJson(map[Attraction.LINKS]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      Attraction.NAME: name,
      Attraction.TYPE: type,
      Attraction.ID: id,
      Attraction.TEST: test,
      Attraction.URL: url,
      Attraction.LOCALE: locale,
      Attraction.EXTERNAL_LINKS: externalLinks.toJson(),
      Attraction.ALIASES: aliases.map((e) => e).toList(),
      Attraction.IMAGES: images
          .map(
            (e) => e.toJson(),
          )
          .toList(),
      Attraction.CLASSIFICATIONS: classifications
          .map(
            (e) => e.toJson(),
          )
          .toList(),
      Attraction.UPCOMING_EVENTS: upcomingEvents.toJsonAttraction(),
      Attraction.LINKS: selfLink.toJson(),
    };
  }
}
