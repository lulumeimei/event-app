import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'event_search_event.dart';
part 'event_search_state.dart';

class EventSearchBloc extends Bloc<EventSearchEvent, EventSearchModel> {
  EventSearchBloc()
      : super(
          EventSearchModel.initial(),
        ) {
    on<QueryStringChanges>(_onQueryStringChanges);
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
