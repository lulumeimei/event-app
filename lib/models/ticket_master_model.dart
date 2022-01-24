// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:ticketapp/models/index.dart';

class TicketMaster extends Equatable {
  static const ID = 'id';
  static const NAME = 'name';
  static const TYPE = 'type';
  static const URL = 'url';
  static const LOCALE = 'locale';
  static const TEST = 'test';
  static const IMAGES = 'images';
  static const SALES = 'sales';
  static const DATES = 'dates';
  static const CLASSIFICATIONS = 'classifications';
  static const PROMOTER = 'promoter';
  static const PROMOTERS = 'promoters';
  static const INFO = 'info';
  static const PRICE_RANGES = 'priceRanges';
  static const PRODUCTS = 'products';
  static const SEAT_MAP = 'seatMap';
  static const ACCESSIBILITY = 'accessibility';
  static const TICKET_LIMIT = 'ticketLimit';
  static const AGE_RESTRICTIONS = 'ageRestrictions';
  static const TICKETING = 'ticketing';
  static const LINKS = '_links';
  static const EMBEDDED = '_embedded';

  final String id;
  final String name;
  final String type;
  final String url;
  final String locale;
  final bool test;
  final List<TicketImage> ticketImageList;
  final Sales sales;
  final TicketDateStatus ticketDateStatus;
  final List<Classification> classificationList;
  final Promoter? promoter;
  final List<Promoter> promoters;
  final String? info;
  final List<PriceRange> priceRanges;
  final List<Product> products;
  final SeatMap? seatMap;
  final Accessibility? accessibility;
  final TicketLimit? ticketLimit;
  final AgeRestriction? ageRestriction;
  final Ticketing? ticketing;
  final TicketLink ticketLink;
  final Embedded embedded;

  const TicketMaster({
    required this.id,
    required this.name,
    required this.type,
    required this.url,
    required this.locale,
    required this.test,
    required this.ticketImageList,
    required this.sales,
    required this.ticketDateStatus,
    required this.classificationList,
    this.promoter,
    required this.promoters,
    this.info,
    required this.priceRanges,
    required this.products,
    this.seatMap,
    this.accessibility,
    this.ticketLimit,
    this.ageRestriction,
    this.ticketing,
    required this.ticketLink,
    required this.embedded,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        type,
        url,
        locale,
        test,
        ticketImageList,
        sales,
        ticketDateStatus,
        classificationList,
        promoter,
        promoters,
        info,
        priceRanges,
        products,
        seatMap,
        accessibility,
        ticketLimit,
        ageRestriction,
        ticketing,
        ticketLink,
        embedded,
      ];

  factory TicketMaster.fromJson(Map<String, dynamic> map) {
    List<TicketImage> ticketImages = [];
    for (Map<String, dynamic> ticketImgMap in map[TicketMaster.IMAGES] ?? []) {
      TicketImage ticketImage = TicketImage.fromJson(ticketImgMap);
      ticketImages.add(ticketImage);
    }

    List<Classification> classificationList = [];
    for (Map<String, dynamic> classificationMap
        in map[TicketMaster.CLASSIFICATIONS] ?? []) {
      Classification classification =
          Classification.fromJson(classificationMap);
      classificationList.add(classification);
    }

    List<Promoter> promoters = [];
    for (Map<String, dynamic> promoterMap
        in map[TicketMaster.PROMOTERS] ?? []) {
      Promoter promoter = Promoter.fromJson(promoterMap);
      promoters.add(promoter);
    }

    List<PriceRange> priceRanges = [];
    for (Map<String, dynamic> priceRangeMap
        in map[TicketMaster.PRICE_RANGES] ?? []) {
      PriceRange priceRange = PriceRange.fromJson(priceRangeMap);
      priceRanges.add(priceRange);
    }

    List<Product> products = [];
    for (Map<String, dynamic> productMap in map[TicketMaster.PRODUCTS] ?? []) {
      Product product = Product.fromJson(productMap);
      products.add(product);
    }

    return TicketMaster(
      id: map[TicketMaster.ID],
      name: map[TicketMaster.NAME],
      type: map[TicketMaster.TYPE],
      url: map[TicketMaster.URL],
      locale: map[TicketMaster.LOCALE],
      test: map[TicketMaster.TEST] ?? false,
      ticketImageList: ticketImages,
      sales: Sales.fromJson(map[TicketMaster.SALES]),
      ticketDateStatus: TicketDateStatus.fromJson(map[TicketMaster.DATES]),
      classificationList: classificationList,
      promoter: map[TicketMaster.PROMOTER] != null
          ? Promoter.fromJson(map[TicketMaster.PROMOTER])
          : null,
      promoters: promoters,
      info: map[TicketMaster.INFO],
      priceRanges: priceRanges,
      products: products,
      seatMap: map[TicketMaster.SEAT_MAP] != null
          ? SeatMap.fromJson(map[TicketMaster.SEAT_MAP])
          : null,
      accessibility: map[TicketMaster.ACCESSIBILITY] != null
          ? Accessibility.fromJson(map[TicketMaster.ACCESSIBILITY])
          : null,
      ticketLimit: map[TicketMaster.TICKET_LIMIT] != null
          ? TicketLimit.fromJson(map[TicketMaster.TICKET_LIMIT])
          : null,
      ageRestriction: map[TicketMaster.AGE_RESTRICTIONS] != null
          ? AgeRestriction.fromJson(map[TicketMaster.AGE_RESTRICTIONS])
          : null,
      ticketing: map[TicketMaster.TICKETING] != null
          ? Ticketing.fromJson(map[TicketMaster.TICKETING])
          : null,
      ticketLink: TicketLink.fromJson(map[TicketMaster.LINKS]),
      embedded: Embedded.fromJson(map[TicketMaster.EMBEDDED]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      TicketMaster.ID: id,
      TicketMaster.NAME: name,
      TicketMaster.TYPE: type,
      TicketMaster.URL: url,
      TicketMaster.LOCALE: locale,
      TicketMaster.TEST: test,
      TicketMaster.IMAGES: ticketImageList
          .map(
            (e) => e.toJson(),
          )
          .toList(),
      TicketMaster.SALES: sales.toJson(),
      TicketMaster.DATES: ticketDateStatus.toJson(),
      TicketMaster.CLASSIFICATIONS: classificationList
          .map(
            (e) => e.toJson(),
          )
          .toList(),
      TicketMaster.PROMOTER: promoter?.toJson(),
      TicketMaster.PROMOTERS: promoters
          .map(
            (e) => e.toJson(),
          )
          .toList(),
      TicketMaster.INFO: info,
      TicketMaster.PRICE_RANGES: priceRanges
          .map(
            (e) => e.toJson(),
          )
          .toList(),
      TicketMaster.PRODUCTS: products
          .map(
            (e) => e.toJson(),
          )
          .toList(),
      TicketMaster.SEAT_MAP: seatMap?.toJson(),
      TicketMaster.ACCESSIBILITY: accessibility?.toJson(),
      TicketMaster.TICKET_LIMIT: ticketLimit?.toJson(),
      TicketMaster.AGE_RESTRICTIONS: ageRestriction?.toJson(),
      TicketMaster.TICKETING: ticketing?.toJson(),
      TicketMaster.LINKS: ticketLink.toJson(),
      TicketMaster.EMBEDDED: embedded.toJson(),
    };
  }
}
