part of 'classification_master_listing_bloc.dart';

abstract class ClassificationMasterListingEvent extends Equatable {
  const ClassificationMasterListingEvent();

  @override
  List<Object> get props => [];
}

class LoadClassificationMasterList extends ClassificationMasterListingEvent {}
