// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

class BoxOfficeInfo extends Equatable {
  static const PHONE_NUMBER_DETAIL = 'phoneNumberDetail';
  static const OPEN_HOURS_DETAIL = 'openHoursDetail';
  static const WILL_CALL_DETAIL = 'willCallDetail';

  final String phoneNumberDetail;
  final String openHoursDetail;
  final String willCallDetail;

  @override
  List<Object?> get props => [
        phoneNumberDetail,
        openHoursDetail,
        willCallDetail,
      ];

  const BoxOfficeInfo({
    required this.phoneNumberDetail,
    required this.openHoursDetail,
    required this.willCallDetail,
  });

  factory BoxOfficeInfo.fromJson(Map<String, dynamic> map) {
    return BoxOfficeInfo(
      phoneNumberDetail: map[BoxOfficeInfo.PHONE_NUMBER_DETAIL],
      openHoursDetail: map[BoxOfficeInfo.OPEN_HOURS_DETAIL],
      willCallDetail: map[BoxOfficeInfo.WILL_CALL_DETAIL],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      BoxOfficeInfo.PHONE_NUMBER_DETAIL: phoneNumberDetail,
      BoxOfficeInfo.OPEN_HOURS_DETAIL: openHoursDetail,
      BoxOfficeInfo.WILL_CALL_DETAIL: willCallDetail,
    };
  }
}
