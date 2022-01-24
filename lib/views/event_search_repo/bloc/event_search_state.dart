part of 'event_search_bloc.dart';

class EventSearchModel extends Equatable {
  final String queryStr;
  final EventSearchState eventSearchState;

  const EventSearchModel({
    required this.queryStr,
    required this.eventSearchState,
  });

  @override
  List<Object?> get props => [
        queryStr,
        eventSearchState,
      ];

  factory EventSearchModel.initial() {
    return EventSearchModel(
      queryStr: '',
      eventSearchState: EventSearchInitial(),
    );
  }

  EventSearchModel copyWith({
    String? newQueryStr,
    EventSearchState? newEventSearchState,
  }) {
    return EventSearchModel(
      queryStr: newQueryStr ?? queryStr,
      eventSearchState: newEventSearchState ?? eventSearchState,
    );
  }
}

abstract class EventSearchState extends Equatable {
  const EventSearchState();

  @override
  List<Object> get props => [];
}

class EventSearchInitial extends EventSearchState {}
