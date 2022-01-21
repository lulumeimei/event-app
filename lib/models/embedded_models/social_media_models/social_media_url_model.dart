// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

class SocialMediaUrl extends Equatable {
  static const URL = 'url';

  final String url;

  const SocialMediaUrl({
    required this.url,
  });

  @override
  List<Object?> get props => [
        url,
      ];

  factory SocialMediaUrl.fromJson(Map<String, dynamic> map) {
    return SocialMediaUrl(
      url: map[SocialMediaUrl.URL],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      SocialMediaUrl.URL: url,
    };
  }
}

