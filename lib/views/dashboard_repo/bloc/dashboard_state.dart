part of 'dashboard_bloc.dart';

class DashboardModel extends Equatable {
  final ClassificationMaster? selectedClassificationMaster;
  final List<TicketMaster> ticketMasterList;
  final int page;
  final int perPage;
  final DashboardState dashboardState;

  const DashboardModel({
    this.selectedClassificationMaster,
    required this.ticketMasterList,
    required this.page,
    required this.perPage,
    required this.dashboardState,
  });

  @override
  List<Object?> get props => [
        selectedClassificationMaster,
        ticketMasterList,
        page,
        perPage,
        dashboardState,
      ];

  factory DashboardModel.initial({
    int? perPage,
  }) {
    return DashboardModel(
      selectedClassificationMaster: null,
      ticketMasterList: const [],
      page: 0,
      perPage: perPage ?? 20,
      dashboardState: DashboardInitial(),
    );
  }

  DashboardModel copyWith({
    required ClassificationMaster? selectedClassificationMaster,
    List<TicketMaster>? newTicketMasterList,
    int? newPage,
    DashboardState? newDashboardState,
  }) {
    return DashboardModel(
      selectedClassificationMaster: selectedClassificationMaster,
      ticketMasterList: newTicketMasterList ?? ticketMasterList,
      page: newPage ?? page,
      perPage: perPage,
      dashboardState: newDashboardState ?? dashboardState,
    );
  }
}

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {}

class DashboardError extends DashboardState {
  final String msg;
  final Object? e;
  final StackTrace? stackTrace;

  const DashboardError({
    required this.msg,
    required this.e,
    required this.stackTrace,
  });
}

class DashboardNextPageFailed extends DashboardState {
  final String msg;
  final Object? e;
  final StackTrace? stackTrace;

  const DashboardNextPageFailed({
    required this.msg,
    required this.e,
    required this.stackTrace,
  });
}
