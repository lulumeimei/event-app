// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:ticketapp/models/index.dart';

class ClassificationMasterGenre extends Equatable {
  static const ID = 'id';
  static const NAME = 'name';
  static const LOCALE = 'locale';
  static const LINKS = '_links';
  static const EMBEDDED = '_embedded';

  final String id;
  final String name;
  final String locale;
  final SelfLink links;
  final ClassificationMasterGenreEmbedded classificationMasterGenreEmbedded;

  const ClassificationMasterGenre({
    required this.id,
    required this.name,
    required this.locale,
    required this.links,
    required this.classificationMasterGenreEmbedded,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        locale,
        links,
        classificationMasterGenreEmbedded,
      ];

  factory ClassificationMasterGenre.fromJson(Map<String, dynamic> map) {
    return ClassificationMasterGenre(
      id: map[ClassificationMasterGenre.ID],
      name: map[ClassificationMasterGenre.NAME],
      locale: map[ClassificationMasterGenre.LOCALE],
      links: SelfLink.fromJson(map[ClassificationMasterGenre.LINKS]),
      classificationMasterGenreEmbedded: ClassificationMasterGenreEmbedded.fromJson(
        map[ClassificationMasterGenre.EMBEDDED],
      ),
    );
  }
}

class ClassificationMasterGenreEmbedded extends Equatable {
  static const SUB_GENRES = 'subgenres';

  final List<ClassificationMasterSubGenre> classificationMasterSubgenreList;
  const ClassificationMasterGenreEmbedded({
    required this.classificationMasterSubgenreList,
  });

  @override
  List<Object?> get props => [
        classificationMasterSubgenreList,
      ];

  factory ClassificationMasterGenreEmbedded.fromJson(Map<String, dynamic> map) {
    List<ClassificationMasterSubGenre> classificationMasterSubgenreList = [];
    for (Map<String, dynamic> classificationSubgenreMap
        in map[ClassificationMasterGenreEmbedded.SUB_GENRES] ?? []) {
      ClassificationMasterSubGenre classificationMasterSubGenre =
          ClassificationMasterSubGenre.fromJson(classificationSubgenreMap);
      classificationMasterSubgenreList.add(classificationMasterSubGenre);
    }
    return ClassificationMasterGenreEmbedded(
      classificationMasterSubgenreList: classificationMasterSubgenreList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ClassificationMasterGenreEmbedded.SUB_GENRES: classificationMasterSubgenreList
          .map(
            (e) => e.toJson(),
          )
          .toList(),
    };
  }
}

class ClassificationMasterSubGenre extends Equatable {
  static const ID = 'id';
  static const NAME = 'name';
  static const LOCALE = 'locale';
  static const LINKS = '_links';

  final String id;
  final String name;
  final String locale;
  final SelfLink links;

  const ClassificationMasterSubGenre({
    required this.id,
    required this.name,
    required this.locale,
    required this.links,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        locale,
        links,
      ];

  factory ClassificationMasterSubGenre.fromJson(Map<String, dynamic> map) {
    return ClassificationMasterSubGenre(
      id: map[ClassificationMasterSubGenre.ID],
      name: map[ClassificationMasterSubGenre.NAME],
      locale: map[ClassificationMasterSubGenre.LOCALE],
      links: SelfLink.fromJson(map[ClassificationMasterSubGenre.LINKS]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ClassificationMasterSubGenre.ID: id,
      ClassificationMasterSubGenre.NAME: name,
      ClassificationMasterSubGenre.LOCALE: locale,
      ClassificationMasterSubGenre.LINKS: links.toJson(),
    };
  }
}
