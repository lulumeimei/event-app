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
  final Promoter promoter;
  final List<Promoter> promoters;
  final String info;
  final List<PriceRange> priceRanges;
  final List<Product> products;
  final SeatMap seatMap;
  final Accessibility accessibility;
  final TicketLimit ticketLimit;
  final AgeRestriction ageRestriction;
  final Ticketing ticketing;
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
    required this.promoter,
    required this.promoters,
    required this.info,
    required this.priceRanges,
    required this.products,
    required this.seatMap,
    required this.accessibility,
    required this.ticketLimit,
    required this.ageRestriction,
    required this.ticketing,
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
      promoter: Promoter.fromJson(map[TicketMaster.PROMOTER]),
      promoters: promoters,
      info: map[TicketMaster.INFO],
      priceRanges: priceRanges,
      products: products,
      seatMap: SeatMap.fromJson(map[TicketMaster.SEAT_MAP]),
      accessibility: Accessibility.fromJson(map[TicketMaster.ACCESSIBILITY]),
      ticketLimit: TicketLimit.fromJson(map[TicketMaster.TICKET_LIMIT]),
      ageRestriction:
          AgeRestriction.fromJson(map[TicketMaster.AGE_RESTRICTIONS]),
      ticketing: Ticketing.fromJson(map[TicketMaster.TICKETING]),
      ticketLink: TicketLink.fromJson(map[TicketMaster.LINKS]),
      embedded: Embedded.fromJson(map[TicketMaster.EMBEDDED]),
    );
  }
}
