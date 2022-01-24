import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:ticketapp/models/index.dart';
import 'package:ticketapp/views/event_listing_repo/bloc/event_listing_bloc.dart';

class EventListingPage extends StatefulWidget {
  const EventListingPage({Key? key}) : super(key: key);

  @override
  _EventListingPageState createState() => _EventListingPageState();
}

class _EventListingPageState extends State<EventListingPage> {
  final RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  @override
  void dispose() {
    super.dispose();
    refreshController.dispose();
  }

  _refreshData() {
    context.read<EventListingBloc>().add(
          RefreshEventList(),
        );
  }

  _loadData() {
    context.read<EventListingBloc>().add(
          LoadEventList(),
        );
  }

  Size get mediaQ {
    return MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventListingBloc, EventListingModel>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Events'),
          ),
          body: BlocListener<EventListingBloc, EventListingModel>(
            listener: (context, state) {
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
              if(state.eventListingState is EventListingLoadSuccess){
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
              onRefresh: _refreshData,
              onLoading: _loadData,
              child: state.ticketList.isNotEmpty
                  ? ListView.builder(
                      itemCount: state.ticketList.length,
                      itemBuilder: (BuildContext context, int index) {
                        TicketMaster ticketMaster = state.ticketList[index];
                        return ListTile(
                          title: Text(
                            ticketMaster.name,
                          ),
                          subtitle: Text(
                            ticketMaster.id,
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
    );
  }
}
