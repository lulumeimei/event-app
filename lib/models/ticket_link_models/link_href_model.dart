// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

class LinkHref extends Equatable {
  static const HREF = 'href';

  final String href;

  const LinkHref({
    required this.href,
  });

  @override
  List<Object?> get props => [
        href,
      ];

  factory LinkHref.fromJson(Map<String, dynamic> map) {
    return LinkHref(
      href: map[LinkHref.HREF],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      LinkHref.HREF: href,
    };
  }
}

class SelfLink extends Equatable {
  static const SELF = 'self';

  final LinkHref linkHref;

  const SelfLink({
    required this.linkHref,
  });

  @override
  List<Object?> get props => [
        linkHref,
      ];

  factory SelfLink.fromJson(Map<String, dynamic> map) {
    return SelfLink(
      linkHref: LinkHref.fromJson(map[SelfLink.SELF]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      SelfLink.SELF: linkHref.toJson(),
    };
  }
}
