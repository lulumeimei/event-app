import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ticketapp/models/index.dart';
import 'package:ticketapp/repositories/ticket_master_repo.dart';

part 'event_detail_event.dart';
part 'event_detail_state.dart';

class EventDetailBloc extends Bloc<EventDetailEvent, EventDetailModel> {
  EventDetailBloc({
    required String id,
    TicketMaster? ticketMaster,
  }) : super(
          EventDetailModel.initial(
            id: id,
            ticketMaster: ticketMaster,
          ),
        ) {
    on<LoadEventDetail>(_onLoadEventDetail);
  }
  TicketMasterRepoInterface ticketMasterRepoInterface =
      TicketMasterRepoInterface();

  _onLoadEventDetail(LoadEventDetail event, Emitter emit) async {
    try {
      emit(
        state.copyWith(
          newEventDetailState: EventDetailInitial(),
        ),
      );
      TicketMaster ticketMaster =
          await ticketMasterRepoInterface.getSpecificTicketMaster(
        id: state.id,
      );
      emit(
        state.copyWith(
          newEventDetailState: EventDetailLoaded(
            ticketMaster: ticketMaster,
          ),
        ),
      );
    } catch (e, stackTrace) {
      emit(
        state.copyWith(
          newEventDetailState: EventDetailLoadFailed(
            msg: 'Load event detail failed',
            e: e,
            stackTrace: stackTrace,
          ),
        ),
      );
    }
  }
}
