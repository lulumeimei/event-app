part of 'event_detail_bloc.dart';

class EventDetailModel extends Equatable {
  final String id;
  final EventDetailState eventDetailState;

  const EventDetailModel({
    required this.id,
    required this.eventDetailState,
  });

  @override
  List<Object?> get props => [
        id,
        eventDetailState,
      ];

  factory EventDetailModel.initial({
    required String id,
    TicketMaster? ticketMaster,
  }) {
    return EventDetailModel(
      id: id,
      eventDetailState: ticketMaster != null
          ? EventDetailLoaded(ticketMaster: ticketMaster)
          : EventDetailInitial(),
    );
  }

  EventDetailModel copyWith({
    EventDetailState? newEventDetailState,
  }) {
    return EventDetailModel(
      id: id,
      eventDetailState: newEventDetailState ?? eventDetailState,
    );
  }
}

abstract class EventDetailState extends Equatable {
  const EventDetailState();

  @override
  List<Object> get props => [];
}

class EventDetailInitial extends EventDetailState {}

class EventDetailLoaded extends EventDetailState {
  final TicketMaster ticketMaster;
  const EventDetailLoaded({
    required this.ticketMaster,
  });
}

class EventDetailLoadFailed extends EventDetailState {
  final String msg;
  final Object? e;
  final StackTrace? stackTrace;

  const EventDetailLoadFailed({
    required this.msg,
    required this.e,
    required this.stackTrace,
  });
}
