// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

class Country extends Equatable {
  static const NAME = 'name';
  static const COUNTRY_CODE = 'countryCode';

  final String name;
  final String countryCode;

  @override
  List<Object?> get props => [
        name,
        countryCode,
      ];

  const Country({
    required this.name,
    required this.countryCode,
  });

  factory Country.fromJson(Map<String, dynamic> map) {
    return Country(
      name: map[Country.NAME],
      countryCode: map[Country.COUNTRY_CODE],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      Country.NAME: name,
      Country.COUNTRY_CODE: countryCode,
    };
  }
}
