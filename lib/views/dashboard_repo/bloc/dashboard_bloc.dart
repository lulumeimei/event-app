import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ticketapp/models/index.dart';
import 'package:ticketapp/repositories/ticket_master_repo.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardModel> {
  DashboardBloc({
    int? perPage,
  }) : super(
          DashboardModel.initial(
            perPage: perPage,
          ),
        ) {
    on<LoadEvents>(_onLoadEvents);
    on<ChangeClassificationMasterFilter>(_onChangeClassificationMasterFilter);
  }

  final TicketMasterRepoInterface ticketMasterRepoInterface =
      TicketMasterRepoInterface();

  _onChangeClassificationMasterFilter(
      ChangeClassificationMasterFilter event, Emitter emit) {
    emit(
      state.copyWith(
        selectedClassificationMaster: event.classificationMaster,
      ),
    );
  }

  _onLoadEvents(LoadEvents event, Emitter emit) async {
    try {
      emit(
        state.copyWith(
            newTicketMasterList: const [],
            selectedClassificationMaster: state.selectedClassificationMaster,
            newDashboardState: DashboardInitial()),
      );
      List<TicketMaster> ticketMasterList =
          await ticketMasterRepoInterface.getTicketMasterList(
        page: 1,
        size: state.perPage,
        classificationId: state
            .selectedClassificationMaster?.classificationMasterSegment?.id,
      );
      emit(
        state.copyWith(
          newTicketMasterList: ticketMasterList,
          selectedClassificationMaster: state.selectedClassificationMaster,
          newDashboardState: DashboardLoaded(),
        ),
      );
    } catch (e, stackTrace) {
      emit(
        state.copyWith(
          selectedClassificationMaster: state.selectedClassificationMaster,
          newDashboardState: DashboardError(
            msg: 'Load events failed',
            e: e,
            stackTrace: stackTrace,
          ),
        ),
      );
    }
  }
}
