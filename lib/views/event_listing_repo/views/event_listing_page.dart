import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:ticketapp/models/index.dart';
import 'package:ticketapp/router_configs/app_routes.dart';
import 'package:ticketapp/views/dashboard_repo/bloc/dashboard_bloc.dart';
import 'package:ticketapp/views/event_detail_repo/index.dart';
import 'package:ticketapp/views/event_listing_repo/bloc/event_listing_bloc.dart';
import 'package:ticketapp/views/event_listing_repo/params/event_listing_page_params.dart';
import 'package:ticketapp/views/event_widget_repo/views/event_widget.dart';

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
                    ? ListView.separated(
                        padding: EdgeInsets.all(10.sp),
                        itemCount: state.ticketList.length,
                        itemBuilder: (BuildContext context, int index) {
                          TicketMaster ticketMaster = state.ticketList[index];
                          return EventWidget(
                            ticketMaster: ticketMaster,
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider(
                            color: Colors.transparent,
                          );
                        },
                      )
                    : Container(
                        padding: EdgeInsets.all(10.sp),
                        width: mediaQ.width,
                        height: mediaQ.height * .7,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: mediaQ.width,
                              height: 200,
                              child: Image.asset(
                                'assets/dashboard/empty.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Ops. No event found',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
