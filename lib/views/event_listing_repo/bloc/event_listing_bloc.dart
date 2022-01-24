import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ticketapp/models/index.dart';
import 'package:ticketapp/repositories/ticket_master_repo.dart';

part 'event_listing_event.dart';
part 'event_listing_state.dart';

class EventListingBloc extends Bloc<EventListingEvent, EventListingModel> {
  EventListingBloc({
    int? perPage,
  }) : super(
          EventListingModel.initial(
            perPage: perPage,
          ),
        ) {
    on<RefreshEventList>(_onRefreshEventList);
    on<LoadEventList>(_onLoadEventList);
  }

  final TicketMasterRepoInterface tickerMasterRepoInterface =
      TicketMasterRepoInterface();

  _onLoadEventList(LoadEventList event, Emitter emit) async {
    try {
      List<TicketMaster> ticketMasterList =
          await tickerMasterRepoInterface.getTicketMasterList(
        size: state.perPage,
        page: state.curPage + 1,
      );
      List<TicketMaster> existingTicketMaster =
          List<TicketMaster>.from(state.ticketList);
      existingTicketMaster.addAll(ticketMasterList);
      emit(
        state.copyWith(
          newCurPage: ticketMasterList.isNotEmpty ? state.curPage + 1 : null,
          newTicketMasterList: existingTicketMaster,
          newEventListingState: ticketMasterList.isNotEmpty
              ? EventListingLoadSuccess()
              : EventListingLoadNoData(),
        ),
      );
    } catch (e, stackTrace) {
      emit(
        state.copyWith(
          newEventListingState: EventListingLoadFailed(
            msg: 'Load event listing failed',
            e: e,
            stackTrace: stackTrace,
          ),
        ),
      );
    }
  }

  _onRefreshEventList(RefreshEventList event, Emitter emit) async {
    try {
      emit(
        state.copyWith(
          newCurPage: 0,
          newEventListingState: EventListingInitial(),
        ),
      );
      List<TicketMaster> ticketMasterList =
          await tickerMasterRepoInterface.getTicketMasterList(
        size: state.perPage,
        page: state.curPage + 1,
      );
      emit(
        state.copyWith(
          newCurPage: ticketMasterList.isNotEmpty ? state.curPage + 1 : null,
          newTicketMasterList: ticketMasterList,
          newEventListingState: EventListingRefreshSuccess(),
        ),
      );
    } catch (e, stackTrace) {
      emit(
        state.copyWith(
          newEventListingState: EventListingRefreshFailed(
            msg: 'Refresh event listing failed',
            e: e,
            stackTrace: stackTrace,
          ),
        ),
      );
    }
  }
}