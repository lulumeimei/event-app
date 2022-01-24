// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:ticketapp/models/index.dart';

class ClassificationMaster extends Equatable {
  static const FAMILY = 'family';
  static const LINKS = '_links';
  static const SEGMENT = 'segment';

  final bool family;
  final SelfLink links;
  final ClassificationMasterSegment classificationMasterSegment;

  const ClassificationMaster({
    required this.family,
    required this.links,
    required this.classificationMasterSegment,
  });

  @override
  List<Object?> get props => [
        family,
        links,
        classificationMasterSegment,
      ];

  factory ClassificationMaster.fromJson(Map<String, dynamic> map) {
    return ClassificationMaster(
      family: map[ClassificationMaster.FAMILY] ?? false,
      links: map[ClassificationMaster.LINKS],
      classificationMasterSegment: ClassificationMasterSegment.fromJson(
        map[ClassificationMaster.SEGMENT],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ClassificationMaster.FAMILY: family,
      ClassificationMaster.LINKS: links.toJson(),
      ClassificationMaster.SEGMENT: classificationMasterSegment.toJson(),
    };
  }
}

class ClassificationMasterSegment {
  static const ID = 'id';
  static const NAME = 'name';
  static const LOCALE = 'locale';
  static const PRIMARY_ID = 'primaryId';
  static const LINKS = '_links';
  static const EMBEDDED = '_embedded';

  final String id;
  final String name;
  final String locale;
  final String primaryID;
  final SelfLink links;
  final ClassificationMasterSegmentEmbedded classificationMasterSegmentEmbedded;

  const ClassificationMasterSegment({
    required this.id,
    required this.name,
    required this.locale,
    required this.primaryID,
    required this.links,
    required this.classificationMasterSegmentEmbedded,
  });

  factory ClassificationMasterSegment.fromJson(Map<String, dynamic> map) {
    return ClassificationMasterSegment(
      id: map[ClassificationMasterSegment.ID],
      name: map[ClassificationMasterSegment.NAME],
      locale: map[ClassificationMasterSegment.LOCALE],
      primaryID: map[ClassificationMasterSegment.PRIMARY_ID],
      links: SelfLink.fromJson(map[ClassificationMasterSegment.LINKS]),
      classificationMasterSegmentEmbedded:
          ClassificationMasterSegmentEmbedded.fromJson(
        map[ClassificationMasterSegment.EMBEDDED],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ClassificationMasterSegment.ID: id,
      ClassificationMasterSegment.NAME: name,
      ClassificationMasterSegment.LOCALE: locale,
      ClassificationMasterSegment.PRIMARY_ID: primaryID,
      ClassificationMasterSegment.LINKS: links.toJson(),
      ClassificationMasterSegment.EMBEDDED:
          classificationMasterSegmentEmbedded.toJson(),
    };
  }
}
