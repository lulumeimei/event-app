part of 'event_listing_bloc.dart';

class EventListingModel extends Equatable {
  final int curPage;
  final int perPage;
  final List<TicketMaster> ticketList;
  final EventListingState eventListingState;

  const EventListingModel({
    required this.curPage,
    required this.perPage,
    required this.ticketList,
    required this.eventListingState,
  });

  @override
  List<Object?> get props => [
        curPage,
        perPage,
        ticketList,
        eventListingState,
      ];

  factory EventListingModel.initial({
    int? perPage,
  }) {
    return EventListingModel(
      curPage: 0,
      perPage: perPage ?? 20,
      ticketList: const [],
      eventListingState: EventListingInitial(),
    );
  }

  EventListingModel copyWith({
    int? newCurPage,
    List<TicketMaster>? newTicketMasterList,
    EventListingState? newEventListingState,
  }) {
    return EventListingModel(
      curPage: newCurPage ?? curPage,
      perPage: perPage,
      ticketList: newTicketMasterList ?? ticketList,
      eventListingState: newEventListingState ?? eventListingState,
    );
  }
}

abstract class EventListingState extends Equatable {
  const EventListingState();

  @override
  List<Object> get props => [];
}

class EventListingInitial extends EventListingState {}

class EventListingRefreshSuccess extends EventListingState {}

class EventListingLoadSuccess extends EventListingState {}

class EventListingLoadNoData extends EventListingState {}

class EventListingRefreshFailed extends EventListingState {
  final String msg;
  final Object? e;
  final StackTrace? stackTrace;

  const EventListingRefreshFailed({
    required this.msg,
    required this.e,
    required this.stackTrace,
  });
}

class EventListingLoadFailed extends EventListingState {
  final String msg;
  final Object? e;
  final StackTrace? stackTrace;

  const EventListingLoadFailed({
    required this.msg,
    required this.e,
    required this.stackTrace,
  });
}
