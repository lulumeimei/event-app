// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:ticketapp/models/classification_models/index.dart';

class Classification extends Equatable {
  static const PRIMARY = 'primary';
  static const FAMILY = 'family';
  static const SEGMENT = 'segment';
  static const GENRE = 'genre';
  static const SUB_GENRE = 'subGenre';
  static const TYPE = 'type';
  static const SUB_TYPE = 'subType';

  final bool primary;
  final bool family;
  final Segment segment;
  final Genre genre;
  final SubGenre subGenre;
  final Type? type;
  final SubType? subType;

  const Classification({
    required this.primary,
    required this.family,
    required this.segment,
    required this.genre,
    required this.subGenre,
    this.type,
    this.subType,
  });

  @override
  List<Object?> get props => [
        primary,
        family,
        segment,
        genre,
        subGenre,
        type,
        subType,
      ];

  factory Classification.fromJson(Map<String, dynamic> map) {
    return Classification(
      primary: map[Classification.PRIMARY] ?? false,
      family: map[Classification.FAMILY] ?? false,
      segment: Segment.fromJson(map[Classification.SEGMENT]),
      genre: Genre.fromJson(map[Classification.GENRE]),
      subGenre: SubGenre.fromJson(map[Classification.SUB_GENRE]),
      type: map[Classification.TYPE] != null
          ? Type.fromJson(map[Classification.TYPE])
          : null,
      subType: map[Classification.SUB_TYPE] != null
          ? SubType.fromJson(map[Classification.SUB_TYPE])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      Classification.PRIMARY: primary,
      Classification.FAMILY: family,
      Classification.SEGMENT: segment.toJson(),
      Classification.GENRE: genre.toJson(),
      Classification.SUB_GENRE: subGenre.toJson(),
      Classification.TYPE: type?.toJson(),
      Classification.SUB_TYPE: subType?.toJson(),
    };
  }

  List<String> get getTags {
    List<String> tags = [
      segment.name,
      genre.name,
      subGenre.name,
    ];
    if (type != null) {
      tags.add(type!.name);
    }
    if (subType != null) {
      tags.add(subType!.name);
    }
    return tags;
  }
}
