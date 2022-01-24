part of 'event_listing_bloc.dart';

class EventListingModel extends Equatable {
  final int curPage;
  final int perPage;
  final List<TicketMaster> ticketList;
  final ClassificationMaster? selectedClassificationMaster;
  final EventListingState eventListingState;

  const EventListingModel({
    required this.curPage,
    required this.perPage,
    required this.ticketList,
    required this.selectedClassificationMaster,
    required this.eventListingState,
  });

  @override
  List<Object?> get props => [
        curPage,
        perPage,
        ticketList,
        selectedClassificationMaster,
        eventListingState,
      ];

  factory EventListingModel.initial({
    int? perPage,
    required ClassificationMaster? selectedClassificationMaster,
    required List<TicketMaster> ticketList,
  }) {
    return EventListingModel(
      curPage: 0,
      perPage: perPage ?? 20,
      ticketList: ticketList,
      selectedClassificationMaster: selectedClassificationMaster,
      eventListingState: EventListingRefreshSuccess(),
    );
  }

  EventListingModel copyWith({
    int? newCurPage,
    List<TicketMaster>? newTicketMasterList,
    required ClassificationMaster? newSelectedClassificationMaster,
    EventListingState? newEventListingState,
  }) {
    return EventListingModel(
      curPage: newCurPage ?? curPage,
      perPage: perPage,
      ticketList: newTicketMasterList ?? ticketList,
      selectedClassificationMaster: newSelectedClassificationMaster,
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
