part of 'event_widget_bloc.dart';

abstract class EventWidgetState extends Equatable {
  const EventWidgetState();
  
  @override
  List<Object> get props => [];
}

class EventWidgetInitial extends EventWidgetState {}
