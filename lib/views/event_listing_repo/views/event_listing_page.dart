import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:ticketapp/models/index.dart';
import 'package:ticketapp/router_configs/app_routes.dart';
import 'package:ticketapp/views/dashboard_repo/bloc/dashboard_bloc.dart';
import 'package:ticketapp/views/event_detail_repo/index.dart';
import 'package:ticketapp/views/event_listing_repo/bloc/event_listing_bloc.dart';
import 'package:ticketapp/views/event_listing_repo/params/event_listing_page_params.dart';

class EventListingPage extends StatefulWidget {
  final EventListingPageParams eventListingPageParams;
  const EventListingPage({
    Key? key,
    required this.eventListingPageParams,
  }) : super(key: key);

  @override
  _EventListingPageState createState() => _EventListingPageState();
}

class _EventListingPageState extends State<EventListingPage> {
  final RefreshController refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    refreshController.dispose();
  }

  Size get mediaQ {
    return MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EventListingBloc>(
      create: (context) => EventListingBloc(
        page: widget.eventListingPageParams.page,
        perPage: widget.eventListingPageParams.perPage,
        selectedClassificationMaster:
            widget.eventListingPageParams.selectedClassificationMaster,
        ticketList: widget.eventListingPageParams.ticketMasterList,
      ),
      child: BlocBuilder<EventListingBloc, EventListingModel>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                state.selectedClassificationMaster == null
                    ? "All Events"
                    : state.selectedClassificationMaster!
                            .classificationMasterSegment?.name ??
                        'Events',
              ),
            ),
            body: BlocListener<EventListingBloc, EventListingModel>(
              listener: (context, state) {
                context.read<DashboardBloc>().add(
                      LoadDataToDashboard(eventListingModel: state),
                    );
                if (state.eventListingState is EventListingRefreshSuccess) {
                  refreshController.refreshCompleted();
                }
                if (state.eventListingState is EventListingRefreshFailed) {
                  refreshController.refreshFailed();
                }
                if (state.eventListingState is EventListingLoadFailed) {
                  refreshController.loadFailed();
                }
                if (state.eventListingState is EventListingLoadNoData) {
                  refreshController.loadNoData();
                }
                if (state.eventListingState is EventListingLoadSuccess) {
                  refreshController.loadComplete();
                }
              },
              child: SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                header: const WaterDropHeader(),
                footer: CustomFooter(
                  builder: (BuildContext context, LoadStatus? mode) {
                    Widget body;
                    if (mode == LoadStatus.idle) {
                      body = const Text("pull up load");
                    } else if (mode == LoadStatus.loading) {
                      body = const CupertinoActivityIndicator();
                    } else if (mode == LoadStatus.failed) {
                      body = const Text("Load Failed!Click retry!");
                    } else if (mode == LoadStatus.canLoading) {
                      body = const Text("release to load more");
                    } else {
                      body = const Text("No more Data");
                    }
                    return SizedBox(
                      height: 55.0,
                      child: Center(child: body),
                    );
                  },
                ),
                controller: refreshController,
                onRefresh: () {
                  context.read<EventListingBloc>().add(
                        RefreshEventList(),
                      );
                },
                onLoading: () {
                  context.read<EventListingBloc>().add(
                        LoadEventList(),
                      );
                },
                child: state.ticketList.isNotEmpty
                    ? ListView.builder(
                        itemCount: state.ticketList.length,
                        itemBuilder: (BuildContext context, int index) {
                          TicketMaster ticketMaster = state.ticketList[index];
                          return ListTile(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.EVENT_DETAIL_PAGE,
                                arguments: EventDetailParams(
                                  id: ticketMaster.id,
                                  ticketMaster: ticketMaster,
                                ),
                              );
                            },
                            title: Text(
                              ticketMaster.name,
                            ),
                            subtitle: Text(
                              ticketMaster.classificationList
                                  .map((e) => e.segment.name)
                                  .toList()
                                  .join(', '),
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: Text('No Data'),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
