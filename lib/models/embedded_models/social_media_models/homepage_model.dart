// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:ticketapp/models/embedded_models/social_media_models/index.dart';

class Homepage extends Equatable {
  static const HOMEPAGE = 'homepage';

  final List<SocialMediaUrl> socialMediaUrls;

  const Homepage({
    required this.socialMediaUrls,
  });

  @override
  List<Object?> get props => [
        socialMediaUrls,
      ];

  factory Homepage.fromJson(List map) {
    List<SocialMediaUrl> socialMediaUrls = [];
    for (Map<String, dynamic> socialMediaMap in map) {
      SocialMediaUrl socialMediaUrl = SocialMediaUrl.fromJson(socialMediaMap);
      socialMediaUrls.add(socialMediaUrl);
    }
    return Homepage(
      socialMediaUrls: socialMediaUrls,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      Homepage.HOMEPAGE: socialMediaUrls
          .map(
            (e) => e.toJson(),
          )
          .toList(),
    };
  }
}
