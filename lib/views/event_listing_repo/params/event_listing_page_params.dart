import 'package:equatable/equatable.dart';
import 'package:ticketapp/models/index.dart';

class EventListingPageParams extends Equatable {
  final int perPage;
  final ClassificationMaster? selectedClassificationMaster;
  final List<TicketMaster> ticketMasterList;

  const EventListingPageParams({
    required this.perPage,
    required this.selectedClassificationMaster,
    required this.ticketMasterList,
  });

  @override
  List<Object?> get props => [
        perPage,
        selectedClassificationMaster,
        ticketMasterList,
      ];
}
