part of 'classification_master_listing_bloc.dart';

class ClassificationMasterListingModel extends Equatable {
  final List<ClassificationMaster> classificationMasterList;
  final ClassificationMasterListingState classificationMasterListingState;

  const ClassificationMasterListingModel({
    required this.classificationMasterList,
    required this.classificationMasterListingState,
  });

  @override
  List<Object?> get props => [
        classificationMasterList,
        classificationMasterListingState,
      ];

  factory ClassificationMasterListingModel.initial() {
    return ClassificationMasterListingModel(
      classificationMasterList: const [],
      classificationMasterListingState: ClassificationMasterListingInitial(),
    );
  }

  ClassificationMasterListingModel copyWith({
    List<ClassificationMaster>? newClassificationMasterList,
    ClassificationMasterListingState? newClassificationMasterListingState,
  }) {
    return ClassificationMasterListingModel(
      classificationMasterList:
          newClassificationMasterList ?? classificationMasterList,
      classificationMasterListingState: newClassificationMasterListingState ??
          classificationMasterListingState,
    );
  }
}

abstract class ClassificationMasterListingState extends Equatable {
  const ClassificationMasterListingState();

  @override
  List<Object> get props => [];
}

class ClassificationMasterListingInitial
    extends ClassificationMasterListingState {}

class ClassificationMasterListingLoaded
    extends ClassificationMasterListingState {}

class ClassificationMasterListingError
    extends ClassificationMasterListingState {
  final String msg;
  final Object? e;
  final StackTrace? stackTrace;

  const ClassificationMasterListingError({
    required this.msg,
    required this.e,
    required this.stackTrace,
  });
}
