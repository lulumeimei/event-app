part of 'event_search_bloc.dart';

class EventSearchModel extends Equatable {
  final String queryStr;
  final EventSearchState eventSearchState;
  final int curPage;
  final int perPage;
  final List<TicketMaster> ticketMasterList;

  const EventSearchModel({
    required this.queryStr,
    required this.eventSearchState,
    required this.curPage,
    required this.perPage,
    required this.ticketMasterList,
  });

  @override
  List<Object?> get props => [
        queryStr,
        eventSearchState,
        curPage,
        perPage,
        ticketMasterList,
      ];

  factory EventSearchModel.initial() {
    return EventSearchModel(
      queryStr: '',
      eventSearchState: EventSearchInitial(),
      curPage: 0,
      perPage: 20,
      ticketMasterList: const [],
    );
  }

  EventSearchModel copyWith({
    String? newQueryStr,
    EventSearchState? newEventSearchState,
    int? newCurPage,
    List<TicketMaster>? newTicketMasterList,
  }) {
    return EventSearchModel(
      queryStr: newQueryStr ?? queryStr,
      eventSearchState: newEventSearchState ?? eventSearchState,
      curPage: newCurPage ?? curPage,
      perPage: perPage,
      ticketMasterList: newTicketMasterList ?? ticketMasterList,
    );
  }
}

abstract class EventSearchState extends Equatable {
  const EventSearchState();

  @override
  List<Object> get props => [];
}

class EventSearchInitial extends EventSearchState {}

class EventSearchRefreshing extends EventSearchState {}

class EventSearchSuccess extends EventSearchState {}
class EventSearchFailed extends EventSearchState {
  final String msg;
  final Object? e;
  final StackTrace? stackTrace;

  const EventSearchFailed({
    required this.msg,
    required this.e,
    required this.stackTrace,
  });
}

class EventSearchLoadingMorePage extends EventSearchState {}

class EventLoadSuccess extends EventSearchState {}

class EventLoadFailed extends EventSearchState {
  final String msg;
  final Object? e;
  final StackTrace? stackTrace;

  const EventLoadFailed({
    required this.msg,
    required this.e,
    required this.stackTrace,
  });
}

class EventLoadNoData extends EventSearchState {}
