part of 'event_detail_bloc.dart';

abstract class EventDetailState extends Equatable {
  const EventDetailState();
  
  @override
  List<Object> get props => [];
}

class EventDetailInitial extends EventDetailState {}
