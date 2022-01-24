// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:ticketapp/models/classification_master_models/classification_genre_model.dart';

class ClassificationMasterSegmentEmbedded extends Equatable {
  static const EMBEDDED = '_embedded';

  final ClassificationMasterGenreEmbedded classificationMasterGenreEmbbed;

  @override
  List<Object?> get props => [
        classificationMasterGenreEmbbed,
      ];

  const ClassificationMasterSegmentEmbedded({
    required this.classificationMasterGenreEmbbed,
  });

  factory ClassificationMasterSegmentEmbedded.fromJson(
      Map<String, dynamic> map) {
    return ClassificationMasterSegmentEmbedded(
      classificationMasterGenreEmbbed:
          ClassificationMasterGenreEmbedded.fromJson(
        map[ClassificationMasterSegmentEmbedded.EMBEDDED],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ClassificationMasterSegmentEmbedded.EMBEDDED:
          classificationMasterGenreEmbbed.toJson(),
    };
  }
}
