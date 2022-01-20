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
  final Classification classification;

  const Product({
    required this.id,
    required this.name,
    required this.url,
    required this.type,
    required this.classification,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        url,
        type,
        classification,
      ];

  factory Product.fromJson(Map<String, dynamic> map) {
    return Product(
      id: map[Product.ID],
      name: map[Product.NAME] ?? '',
      url: map[Product.URL] ?? '',
      type: map[Product.TYPE] ?? '',
      classification: Classification.fromJson(map[Product.CLASSIFICATION]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      Product.ID: id,
      Product.NAME: name,
      Product.URL: url,
      Product.TYPE: type,
      Product.CLASSIFICATION: classification.toJson(),
    };
  }
}
