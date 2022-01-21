// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:ticketapp/models/embedded_models/social_media_models/index.dart';

class Wiki extends Equatable {
  static const WIKI = 'wiki';

  final List<SocialMediaUrl> socialMediaUrls;

  const Wiki({
    required this.socialMediaUrls,
  });

  @override
  List<Object?> get props => [
        socialMediaUrls,
      ];

  factory Wiki.fromJson(Map<String, dynamic> map) {
    List<SocialMediaUrl> socialMediaUrls = [];
    for (Map<String, dynamic> socialMediaMap in map[Wiki.WIKI] ?? []) {
      SocialMediaUrl socialMediaUrl = SocialMediaUrl.fromJson(socialMediaMap);
      socialMediaUrls.add(socialMediaUrl);
    }
    return Wiki(
      socialMediaUrls: socialMediaUrls,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      Wiki.WIKI: socialMediaUrls
          .map(
            (e) => e.toJson(),
          )
          .toList(),
    };
  }
}
