// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:ticketapp/models/embedded_models/social_media_models/index.dart';

class Twitter extends Equatable {
  static const TWITTER = 'twitter';

  final List<SocialMediaUrl> socialMediaUrls;

  const Twitter({
    required this.socialMediaUrls,
  });

  @override
  List<Object?> get props => [
        socialMediaUrls,
      ];

  factory Twitter.fromJson(Map<String, dynamic> map) {
    List<SocialMediaUrl> socialMediaUrls = [];
    for (Map<String, dynamic> socialMediaMap in map[Twitter.TWITTER] ?? []) {
      SocialMediaUrl socialMediaUrl = SocialMediaUrl.fromJson(socialMediaMap);
      socialMediaUrls.add(socialMediaUrl);
    }
    return Twitter(
      socialMediaUrls: socialMediaUrls,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      Twitter.TWITTER: socialMediaUrls
          .map(
            (e) => e.toJson(),
          )
          .toList(),
    };
  }
}
