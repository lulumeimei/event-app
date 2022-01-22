// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:ticketapp/models/embedded_models/social_media_models/index.dart';

class Facebook extends Equatable {
  static const FACEBOOK = 'facebook';

  final List<SocialMediaUrl> socialMediaUrls;

  const Facebook({
    required this.socialMediaUrls,
  });

  @override
  List<Object?> get props => [
        socialMediaUrls,
      ];

  factory Facebook.fromJson(List map) {
    List<SocialMediaUrl> socialMediaUrls = [];
    for (Map<String, dynamic> socialMediaMap in map) {
      SocialMediaUrl socialMediaUrl = SocialMediaUrl.fromJson(socialMediaMap);
      socialMediaUrls.add(socialMediaUrl);
    }
    return Facebook(
      socialMediaUrls: socialMediaUrls,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      Facebook.FACEBOOK: socialMediaUrls
          .map(
            (e) => e.toJson(),
          )
          .toList(),
    };
  }
}
