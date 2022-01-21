// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:ticketapp/models/embedded_models/index.dart';
import 'package:ticketapp/models/index.dart';

class Venue extends Equatable {
  static const NAME = 'name';
  static const TYPE = 'type';
  static const ID = 'id';
  static const TEST = 'test';
  static const URL = 'url';
  static const LOCALE = 'locale';
  static const IMAGES = 'images';
  static const POSTCODE = 'postalCode';
  static const TIMEZONE = 'timezone';
  static const CITY = 'city';
  static const STATE = 'state';
  static const COUNTRY = 'country';
  static const ADDRESS = 'address';
  static const LOCATION = 'location';
  static const MARKETS = 'markets';
  static const DMAS = 'dmas';
  static const BOX_OFFICE_INFO = 'boxOfficeInfo';
  static const PARKING_DETAIL = 'parkingDetail';
  static const ACCESSIBLE_SEATING_DETAIL = 'accessibleSeatingDetail';
  static const GENERAL_INFO = 'generalInfo';
  static const UPCOMING_EVENTS = 'upcomingEvents';
  static const LINKS = '_links';

  final String name;
  final String type;
  final String id;
  final bool test;
  final String url;
  final String locale;
  final List<TicketImage> images;
  final String postcode;
  final String timezone;
  final City city;
  final StateModel stateModel;
  final Country country;
  final Address address;
  final Location location;
  final List<Market> markets;
  final List<DMas> dmasList;
  final BoxOfficeInfo boxOfficeInfo;
  final String parkingDetail;
  final String accessibleSeatingDetail;
  final GeneralInfo generalInfo;
  final UpcomingEvents upcomingEvents;
  final Links links;

  @override
  List<Object?> get props => [
        name,
        type,
        id,
        test,
        url,
        locale,
        images,
        postcode,
        timezone,
        city,
        stateModel,
        country,
        address,
        location,
        markets,
        dmasList,
        boxOfficeInfo,
        parkingDetail,
        accessibleSeatingDetail,
        generalInfo,
        upcomingEvents,
        links,
      ];

  const Venue({
    required this.name,
    required this.type,
    required this.id,
    required this.test,
    required this.url,
    required this.locale,
    required this.images,
    required this.postcode,
    required this.timezone,
    required this.city,
    required this.stateModel,
    required this.country,
    required this.address,
    required this.location,
    required this.markets,
    required this.dmasList,
    required this.boxOfficeInfo,
    required this.parkingDetail,
    required this.accessibleSeatingDetail,
    required this.generalInfo,
    required this.upcomingEvents,
    required this.links,
  });

  factory Venue.fromJson(Map<String, dynamic> map) {
    List<TicketImage> images = [];
    for (Map<String, dynamic> imageMap in map[Venue.IMAGES] ?? []) {
      TicketImage ticketImage = TicketImage.fromJson(imageMap);
      images.add(ticketImage);
    }

    List<Market> markets = [];
    for (Map<String, dynamic> marketMap in map[Venue.MARKETS] ?? []) {
      Market market = Market.fromJson(marketMap);
      markets.add(market);
    }

    List<DMas> dmasList = [];
    for (Map<String, dynamic> dMasMap in map[Venue.DMAS] ?? []) {
      DMas dMas = DMas.fromJson(dMasMap);
      dmasList.add(dMas);
    }

    return Venue(
      name: map[Venue.NAME],
      type: map[Venue.TYPE],
      id: map[Venue.ID],
      test: map[Venue.TEST],
      url: map[Venue.URL],
      locale: map[Venue.LOCALE],
      images: images,
      postcode: map[Venue.POSTCODE],
      timezone: map[Venue.TIMEZONE],
      city: City.fromJson(map[Venue.CITY]),
      stateModel: StateModel.fromJson(map[Venue.STATE]),
      country: Country.fromJson(map[Venue.COUNTRY]),
      address: Address.fromJson(map[Venue.ADDRESS]),
      location: Location.fromJson(map[Venue.LOCATION]),
      markets: markets,
      dmasList: dmasList,
      boxOfficeInfo: BoxOfficeInfo.fromJson(map[Venue.BOX_OFFICE_INFO]),
      parkingDetail: map[Venue.PARKING_DETAIL],
      accessibleSeatingDetail: map[Venue.ACCESSIBLE_SEATING_DETAIL],
      generalInfo: GeneralInfo.fromJson(map[Venue.GENERAL_INFO]),
      upcomingEvents: UpcomingEvents.fromJson(map[Venue.UPCOMING_EVENTS]),
      links: Links.fromJson(map[Venue.LINKS]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      Venue.NAME: name,
      Venue.TYPE: type,
      Venue.ID: id,
      Venue.TEST: test,
      Venue.URL: url,
      Venue.LOCALE: locale,
      Venue.IMAGES: images
          .map(
            (e) => e.toJson(),
          )
          .toList(),
      Venue.POSTCODE: postcode,
      Venue.TIMEZONE: timezone,
      Venue.CITY: city.toJson(),
      Venue.STATE: stateModel.toJson(),
      Venue.COUNTRY: country.toJson(),
      Venue.ADDRESS: address.toJson(),
      Venue.LOCATION: location.toJson(),
      Venue.MARKETS: markets
          .map(
            (e) => e.toJson(),
          )
          .toList(),
      Venue.DMAS: dmasList
          .map(
            (e) => e.toJson(),
          )
          .toList(),
      Venue.BOX_OFFICE_INFO: boxOfficeInfo.toJson(),
      Venue.PARKING_DETAIL: parkingDetail,
      Venue.ACCESSIBLE_SEATING_DETAIL: accessibleSeatingDetail,
      Venue.GENERAL_INFO: generalInfo.toJson(),
      Venue.UPCOMING_EVENTS: upcomingEvents.toJson(),
      Venue.LINKS: links.toJson(),
    };
  }
}
