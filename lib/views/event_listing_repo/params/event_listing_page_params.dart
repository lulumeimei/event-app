import 'package:equatable/equatable.dart';
import 'package:ticketapp/models/index.dart';

class EventListingPageParams extends Equatable {
  final int page;
  final int perPage;
  final ClassificationMaster? selectedClassificationMaster;
  final List<TicketMaster> ticketMasterList;

  const EventListingPageParams({
    required this.page,
    required this.perPage,
    required this.selectedClassificationMaster,
    required this.ticketMasterList,
  });

  @override
  List<Object?> get props => [
        page,
        perPage,
        selectedClassificationMaster,
        ticketMasterList,
      ];
}
