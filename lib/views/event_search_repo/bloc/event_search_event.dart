part of 'event_search_bloc.dart';

abstract class EventSearchEvent extends Equatable {
  const EventSearchEvent();

  @override
  List<Object> get props => [];
}

class OnFocusOnSearchField extends EventSearchEvent {}

class QueryStringChanges extends EventSearchEvent {
  final String val;
  const QueryStringChanges({
    required this.val,
  });
}

class OnSearchTriggered extends EventSearchEvent {}

class NextEventSearchPage extends EventSearchEvent {}
