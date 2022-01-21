// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:ticketapp/models/ticket_link_models/index.dart';

class TicketLink extends Equatable {
  static const SELF_LINK = 'self';
  static const ATTRACTIONS = 'attractions';
  static const VENUES = 'venues';

  final SelfLink selfLink;
  final List<LinkHref> attractionLinks;
  final List<LinkHref> venueLinks;

  @override
  List<Object?> get props => [
        selfLink,
        attractionLinks,
        venueLinks,
      ];

  const TicketLink({
    required this.selfLink,
    required this.attractionLinks,
    required this.venueLinks,
  });

  factory TicketLink.fromJson(Map<String, dynamic> map) {
    List<LinkHref> attractionLinks = [];
    for (Map<String, dynamic> attractionLinkMap
        in map[TicketLink.ATTRACTIONS] ?? []) {
      LinkHref linkHref = LinkHref.fromJson(attractionLinkMap);
      attractionLinks.add(linkHref);
    }
    List<LinkHref> venueLinks = [];

    for (Map<String, dynamic> venueLinkMap in map[TicketLink.VENUES] ?? []) {
      LinkHref linkHref = LinkHref.fromJson(venueLinkMap);
      venueLinks.add(linkHref);
    }
    return TicketLink(
      selfLink: SelfLink.fromJson(
        map[TicketLink.SELF_LINK],
      ),
      attractionLinks: attractionLinks,
      venueLinks: venueLinks,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      TicketLink.SELF_LINK: selfLink.toJson(),
      TicketLink.ATTRACTIONS: attractionLinks
          .map(
            (e) => e.toJson(),
          )
          .toList(),
      TicketLink.VENUES: venueLinks
          .map(
            (e) => e.toJson(),
          )
          .toList(),
    };
  }
}
