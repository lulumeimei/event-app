// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:ticketapp/models/index.dart';

class Product extends Equatable {
  static const ID = 'id';
  static const NAME = 'name';
  static const URL = 'url';
  static const TYPE = 'type';
  static const CLASSIFICATION = 'classification';

  final String id;
  final String name;
  final String url;
  final String type;
  final List<Classification> classifications;

  const Product({
    required this.id,
    required this.name,
    required this.url,
    required this.type,
    required this.classifications,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        url,
        type,
        classifications,
      ];

  factory Product.fromJson(Map<String, dynamic> map) {
    List<Classification> classificationList = [];
    for (Map<String, dynamic> classificationMap
        in map[Product.CLASSIFICATION] ?? []) {
      Classification classification =
          Classification.fromJson(classificationMap);
      classificationList.add(classification);
    }
    return Product(
      id: map[Product.ID],
      name: map[Product.NAME] ?? '',
      url: map[Product.URL] ?? '',
      type: map[Product.TYPE] ?? '',
      classifications: classificationList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      Product.ID: id,
      Product.NAME: name,
      Product.URL: url,
      Product.TYPE: type,
      Product.CLASSIFICATION: classifications
          .map(
            (e) => e.toJson(),
          )
          .toList(),
    };
  }
}
