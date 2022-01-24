import 'package:equatable/equatable.dart';
import 'package:ticketapp/models/index.dart';

class EventDetailParams extends Equatable {
  final String id;
  final TicketMaster? ticketMaster;

  const EventDetailParams({
    required this.id,
    this.ticketMaster,
  });

  @override
  List<Object?> get props => [
        id,
        ticketMaster,
      ];
}
