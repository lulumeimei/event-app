import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketapp/views/classification_master_listing_repo/bloc/classification_master_listing_bloc.dart';
import 'package:ticketapp/views/dashboard_repo/bloc/dashboard_bloc.dart';
import 'package:ticketapp/views/event_listing_repo/bloc/event_listing_bloc.dart';

class ClassificationMasterListingWidget extends StatefulWidget {
  const ClassificationMasterListingWidget({Key? key}) : super(key: key);

  @override
  _ClassificationMasterListingWidgetState createState() =>
      _ClassificationMasterListingWidgetState();
}

class _ClassificationMasterListingWidgetState
    extends State<ClassificationMasterListingWidget> {
  final RoundedRectangleBorder _buttonShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(
        30.0,
      ),
    ),
  );
  late final _activeButtonColor = Theme.of(context).primaryColor;
  late final _inActiveButtonColor = Theme.of(context).cardColor;
  late final _activeFontColor = Colors.white;
  late final _inActiveFontColor = Theme.of(context).textTheme.bodyText2?.color;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _loadData() {
    context.read<ClassificationMasterListingBloc>().add(
          LoadClassificationMasterList(),
        );
  }

  Size get mediaQ {
    return MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardModel>(
        builder: (context, dashboardState) {
      return BlocBuilder<ClassificationMasterListingBloc,
          ClassificationMasterListingModel>(
        builder: (context, state) {
          if (state.classificationMasterListingState
              is ClassificationMasterListingInitial) {}
          if (state.classificationMasterListingState
              is ClassificationMasterListingLoaded) {
            return SizedBox(
              width: mediaQ.width,
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 10,
                ),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: state.classificationMasterList.map((e) {
                    return Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: MaterialButton(
                        onPressed: () {
                          context.read<DashboardBloc>().add(
                                ChangeClassificationMasterFilter(
                                    classificationMaster: e),
                              );
                          Future.delayed(const Duration(milliseconds: 30), () {
                            context.read<DashboardBloc>().add(
                                  LoadEvents(),
                                );
                          });
                        },
                        shape: _buttonShape,
                        color: context
                                    .read<DashboardBloc>()
                                    .state
                                    .selectedClassificationMaster ==
                                e
                            ? _activeButtonColor
                            : _inActiveButtonColor,
                        child: Text(
                          e.classificationMasterSegment?.name ?? 'undefined',
                          style:
                              Theme.of(context).textTheme.bodyText2?.copyWith(
                                    color: context
                                                .read<DashboardBloc>()
                                                .state
                                                .selectedClassificationMaster ==
                                            e
                                        ? _activeFontColor
                                        : _inActiveFontColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    );
                  }).toList()
                    ..insert(
                      0,
                      Container(
                        padding: EdgeInsets.zero,
                        child: MaterialButton(
                          onPressed: () {
                            context.read<DashboardBloc>().add(
                                  const ChangeClassificationMasterFilter(
                                      classificationMaster: null),
                                );
                            Future.delayed(const Duration(milliseconds: 30),
                                () {
                              context.read<DashboardBloc>().add(
                                    LoadEvents(),
                                  );
                            });
                          },
                          shape: _buttonShape,
                          color: context
                                      .read<DashboardBloc>()
                                      .state
                                      .selectedClassificationMaster ==
                                  null
                              ? _activeButtonColor
                              : _inActiveButtonColor,
                          child: Text(
                            'All',
                            style:
                                Theme.of(context).textTheme.bodyText2?.copyWith(
                                      color: context
                                                  .read<DashboardBloc>()
                                                  .state
                                                  .selectedClassificationMaster ==
                                              null
                                          ? _activeFontColor
                                          : _inActiveFontColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                      ),
                    ),
                ),
              ),
            );
          }
          if (state.classificationMasterListingState
              is ClassificationMasterListingError) {
            return Container(
              width: mediaQ.width,
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const Text('Error'),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _loadData,
                    child: const Text(
                      'Retry',
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      );
    });
  }
}
