// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

class PriceRange extends Equatable {
  static const TYPE = 'type';
  static const CURRENCY = 'currency';
  static const MIN = 'min';
  static const MAX = 'max';

  final String type;
  final String currency;
  final double min;
  final double max;

  const PriceRange({
    required this.type,
    required this.currency,
    required this.min,
    required this.max,
  });

  @override
  List<Object?> get props => [
        type,
        currency,
        min,
        max,
      ];

  factory PriceRange.fromJson(Map<String, dynamic> map) {
    return PriceRange(
      type: map[PriceRange.TYPE],
      currency: map[PriceRange.CURRENCY],
      min: map[PriceRange.MIN] != null
          ? double.parse(map[PriceRange.MIN].toString())
          : 0.0,
      max: map[PriceRange.MAX] != null
          ? double.parse(map[PriceRange.MAX].toString())
          : 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      PriceRange.TYPE: type,
      PriceRange.CURRENCY: currency,
      PriceRange.MIN: min,
      PriceRange.MAX: max,
    };
  }
}
