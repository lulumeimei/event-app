// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:ticketapp/models/index.dart';

class Links extends Equatable {
  static const SELF = 'self';

  final LinkHref linkHref;

  @override
  List<Object?> get props => [
        linkHref,
      ];

  const Links({
    required this.linkHref,
  });

  factory Links.fromJson(Map<String, dynamic> map) {
    return Links(
      linkHref: LinkHref.fromJson(map[Links.SELF]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      Links.SELF: linkHref.toJson(),
    };
  }
}
