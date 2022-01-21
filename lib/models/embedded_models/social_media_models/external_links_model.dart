// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:ticketapp/models/embedded_models/social_media_models/index.dart';

class ExternalLinks extends Equatable {
  static const TWITTER = 'twitter';
  static const WIKI = 'wiki';
  static const FACEBOOK = 'facebook';
  static const INSTAGRAM = 'instagram';
  static const HOMEPAGE = 'homepage';

  final Twitter twitter;
  final Wiki wiki;
  final Facebook facebook;
  final Instagram instagram;
  final Homepage homepage;

  @override
  List<Object?> get props => [
        twitter,
        wiki,
        facebook,
        instagram,
        homepage,
      ];

  const ExternalLinks({
    required this.twitter,
    required this.wiki,
    required this.facebook,
    required this.instagram,
    required this.homepage,
  });

  factory ExternalLinks.fromJson(Map<String, dynamic> map) {
    return ExternalLinks(
      twitter: Twitter.fromJson(map[ExternalLinks.TWITTER]),
      wiki: Wiki.fromJson(map[ExternalLinks.WIKI]),
      facebook: Facebook.fromJson(map[ExternalLinks.FACEBOOK]),
      instagram: Instagram.fromJson(map[ExternalLinks.INSTAGRAM]),
      homepage: Homepage.fromJson(map[ExternalLinks.HOMEPAGE]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ExternalLinks.TWITTER: twitter.toJson(),
      ExternalLinks.WIKI: wiki.toJson(),
      ExternalLinks.FACEBOOK: facebook.toJson(),
      ExternalLinks.INSTAGRAM: instagram.toJson(),
      ExternalLinks.HOMEPAGE: homepage.toJson(),
    };
  }
}
