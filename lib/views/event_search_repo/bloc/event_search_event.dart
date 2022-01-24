part of 'event_search_bloc.dart';

abstract class EventSearchEvent extends Equatable {
  const EventSearchEvent();

  @override
  List<Object> get props => [];
}

class QueryStringChanges extends EventSearchEvent {
  final String val;
  const QueryStringChanges({
    required this.val,
  });
}
