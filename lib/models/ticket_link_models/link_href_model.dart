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

class SelfLink extends LinkHref {
  const SelfLink({
    required String href,
  }) : super(
          href: href,
        );
}

class AttractionLink extends LinkHref {
  const AttractionLink({
    required String href,
  }) : super(
          href: href,
        );
}

class VenueLink extends LinkHref {
  const VenueLink({
    required String href,
  }) : super(
          href: href,
        );
}
