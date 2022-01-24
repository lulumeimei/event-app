import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ticketapp/models/classification_master_models/index.dart';
import 'package:ticketapp/repositories/classification_master_repo.dart';

part 'classification_master_listing_event.dart';
part 'classification_master_listing_state.dart';

class ClassificationMasterListingBloc extends Bloc<
    ClassificationMasterListingEvent, ClassificationMasterListingModel> {
  ClassificationMasterListingBloc()
      : super(
          ClassificationMasterListingModel.initial(),
        ) {
    on<LoadClassificationMasterList>(_onLoadClassificationMasterList);
  }

  final ClassificationMasterRepoInterface classificationMasterRepoInterface =
      ClassificationMasterRepoInterface();

  _onLoadClassificationMasterList(
      LoadClassificationMasterList event, Emitter emit) async {
    try {
      if (state.classificationMasterListingState
          is ClassificationMasterListingLoaded) {
        return;
      }
      emit(
        state.copyWith(
          newClassificationMasterListingState:
              ClassificationMasterListingInitial(),
        ),
      );
      List<ClassificationMaster> classificationMasterList =
          await classificationMasterRepoInterface.classificationMasterList();

      emit(
        state.copyWith(
          newClassificationMasterList: classificationMasterList,
          newClassificationMasterListingState:
              ClassificationMasterListingLoaded(),
        ),
      );
    } catch (e, stackTrace) {
      emit(
        state.copyWith(
          newClassificationMasterListingState: ClassificationMasterListingError(
            msg: 'Load classification master failed',
            e: e,
            stackTrace: stackTrace,
          ),
        ),
      );
    }
  }
}
