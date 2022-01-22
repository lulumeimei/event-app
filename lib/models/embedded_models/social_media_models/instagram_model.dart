// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:ticketapp/models/embedded_models/social_media_models/index.dart';

class Instagram extends Equatable {
  static const INSTAGRAM = 'instagram';

  final List<SocialMediaUrl> socialMediaUrls;

  const Instagram({
    required this.socialMediaUrls,
  });

  @override
  List<Object?> get props => [
        socialMediaUrls,
      ];

  factory Instagram.fromJson(List map) {
    List<SocialMediaUrl> socialMediaUrls = [];
    for (Map<String, dynamic> socialMediaMap in map) {
      SocialMediaUrl socialMediaUrl = SocialMediaUrl.fromJson(socialMediaMap);
      socialMediaUrls.add(socialMediaUrl);
    }
    return Instagram(
      socialMediaUrls: socialMediaUrls,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      Instagram.INSTAGRAM: socialMediaUrls
          .map(
            (e) => e.toJson(),
          )
          .toList(),
    };
  }
}
