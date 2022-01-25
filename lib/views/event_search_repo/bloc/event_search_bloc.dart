import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ticketapp/models/index.dart';
import 'package:ticketapp/repositories/ticket_master_repo.dart';

part 'event_search_event.dart';
part 'event_search_state.dart';

class EventSearchBloc extends Bloc<EventSearchEvent, EventSearchModel> {
  EventSearchBloc()
      : super(
          EventSearchModel.initial(),
        ) {
    on<OnFocusOnSearchField>(_onFocusOnSearchField);
    on<OnSearchTriggered>(_onSearchTriggered);
    on<QueryStringChanges>(_onQueryStringChanges);
    on<NextEventSearchPage>(_onNextEventSearchPage);
  }

  final TicketMasterRepoInterface ticketMasterRepoInterface =
      TicketMasterRepoInterface();

  _onNextEventSearchPage(NextEventSearchPage event, Emitter emit) async {
    try {
      emit(
        state.copyWith(
          newEventSearchState: EventSearchLoadingMorePage(),
        ),
      );
      List<TicketMaster> ticketMasterList =
          await ticketMasterRepoInterface.getTicketMasterList(
        page: state.curPage + 1,
        size: state.perPage,
        keyword: state.queryStr,
      );
      List<TicketMaster> existingTicketMasterList =
          List<TicketMaster>.from(state.ticketMasterList);
      existingTicketMasterList.addAll(ticketMasterList);
      emit(
        state.copyWith(
          newCurPage: ticketMasterList.isNotEmpty ? state.curPage + 1 : null,
          newEventSearchState: ticketMasterList.isNotEmpty
              ? EventLoadSuccess()
              : EventLoadNoData(),
          newTicketMasterList: existingTicketMasterList,
        ),
      );
    } catch (e, stackTrace) {
      emit(
        state.copyWith(
          newEventSearchState: EventLoadFailed(
            msg: 'Load next page event failed',
            e: e,
            stackTrace: stackTrace,
          ),
        ),
      );
    }
  }

  _onFocusOnSearchField(OnFocusOnSearchField event, Emitter emit) {
    emit(
      state.copyWith(
        newCurPage: 0,
        newEventSearchState: EventSearchInitial(),
      ),
    );
  }

  _onSearchTriggered(OnSearchTriggered event, Emitter emit) async {
    try {
      emit(
        state.copyWith(
          newEventSearchState: EventSearchRefreshing(),
        ),
      );
      List<TicketMaster> ticketMasterList =
          await ticketMasterRepoInterface.getTicketMasterList(
        page: 1,
        size: state.perPage,
        keyword: state.queryStr,
      );
      emit(
        state.copyWith(
          newCurPage: 1,
          newTicketMasterList: ticketMasterList,
          newEventSearchState: EventSearchSuccess(),
        ),
      );
    } catch (e, stackTrace) {
      emit(
        state.copyWith(
          newEventSearchState: EventSearchFailed(
            msg: 'Search events failed',
            e: e,
            stackTrace: stackTrace,
          ),
        ),
      );
    }
  }

  _onQueryStringChanges(QueryStringChanges event, Emitter emit) {
    emit(
      state.copyWith(
        newQueryStr: event.val,
        newEventSearchState: EventSearchInitial(),
      ),
    );
  }
}
