// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

class TicketImage extends Equatable {
  static const RATIO = 'ratio';
  static const URL = 'url';
  static const WIDTH = 'width';
  static const HEIGHT = 'height';
  static const FALLBACK = 'fallback';

  final String ratio;
  final String url;
  final double width;
  final double height;
  final bool fallback;

  const TicketImage({
    required this.ratio,
    required this.url,
    required this.width,
    required this.height,
    required this.fallback,
  });

  @override
  List<Object?> get props => [
        ratio,
        url,
        width,
        height,
        fallback,
      ];

  factory TicketImage.fromJson(Map<String, dynamic> map) {
    return TicketImage(
      ratio: map[TicketImage.RATIO] ?? '',
      url: map[TicketImage.URL] ?? '',
      width: map[TicketImage.WIDTH] != null
          ? double.parse(
              map[TicketImage.WIDTH].toString(),
            )
          : 0.0,
      height: map[TicketImage.HEIGHT] != null
          ? double.parse(map[TicketImage.HEIGHT].toString())
          : 0.0,
      fallback: map[TicketImage.FALLBACK] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      TicketImage.RATIO: ratio,
      TicketImage.URL: url,
      TicketImage.WIDTH: width,
      TicketImage.HEIGHT: height,
      TicketImage.FALLBACK: fallback,
    };
  }
}
