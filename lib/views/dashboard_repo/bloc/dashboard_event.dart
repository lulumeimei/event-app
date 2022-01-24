part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class LoadEvents extends DashboardEvent {}

class NewEventsPage extends DashboardEvent {}

class ChangeClassificationMasterFilter extends DashboardEvent {
  final ClassificationMaster? classificationMaster;

  const ChangeClassificationMasterFilter({
    required this.classificationMaster,
  });
}

class LoadDataToDashboard extends DashboardEvent {
  final EventListingModel eventListingModel;
  const LoadDataToDashboard({
    required this.eventListingModel,
  });
}
