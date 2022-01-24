import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ticketapp/models/index.dart';
import 'package:ticketapp/repositories/ticket_master_repo.dart';
import 'package:ticketapp/views/event_listing_repo/bloc/event_listing_bloc.dart';

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
    on<NewEventsPage>(_onNextEventsPage);
    on<ChangeClassificationMasterFilter>(_onChangeClassificationMasterFilter);
    on<LoadDataToDashboard>(_onLoadDataToDashboard);
  }

  final TicketMasterRepoInterface ticketMasterRepoInterface =
      TicketMasterRepoInterface();

  _onLoadDataToDashboard(LoadDataToDashboard event, Emitter emit) {
    emit(
      state.copyWith(
        newPage: event.eventListingModel.curPage,
        newTicketMasterList: event.eventListingModel.ticketList,
        selectedClassificationMaster: state.selectedClassificationMaster,
      ),
    );
  }

  _onNextEventsPage(NewEventsPage event, Emitter emit) async {
    try {
      emit(state.copyWith(
        newDashboardState: DashboardLoading(),
        selectedClassificationMaster: state.selectedClassificationMaster,
      ));
      List<TicketMaster> ticketMasterList =
          await ticketMasterRepoInterface.getTicketMasterList(
        page: state.page + 1,
        size: state.perPage,
        classificationId:
            state.selectedClassificationMaster?.classificationMasterSegment?.id,
      );
      List<TicketMaster> existingTickets = List<TicketMaster>.from(
        state.ticketMasterList,
      );
      existingTickets.addAll(ticketMasterList);
      emit(
        state.copyWith(
          newPage: ticketMasterList.isNotEmpty ? state.page + 1 : null,
          newTicketMasterList: existingTickets,
          selectedClassificationMaster: state.selectedClassificationMaster,
          newDashboardState: DashboardLoaded(),
        ),
      );
    } catch (e, stackTrace) {
      emit(
        state.copyWith(
          selectedClassificationMaster: state.selectedClassificationMaster,
          newDashboardState: DashboardNextPageFailed(
            msg: 'Load next page events failed',
            e: e,
            stackTrace: stackTrace,
          ),
        ),
      );
    }
  }

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
        classificationId:
            state.selectedClassificationMaster?.classificationMasterSegment?.id,
      );
      emit(
        state.copyWith(
          newPage: 1,
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
