part of 'event_listing_bloc.dart';

abstract class EventListingEvent extends Equatable {
  const EventListingEvent();

  @override
  List<Object> get props => [];
}

class RefreshEventList extends EventListingEvent {}

class LoadEventList extends EventListingEvent {}

