import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'event_widget_event.dart';
part 'event_widget_state.dart';

class EventWidgetBloc extends Bloc<EventWidgetEvent, EventWidgetState> {
  EventWidgetBloc() : super(EventWidgetInitial()) {
    on<EventWidgetEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
