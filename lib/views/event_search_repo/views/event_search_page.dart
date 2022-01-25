import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ticketapp/models/index.dart';
import 'package:ticketapp/views/event_search_repo/bloc/event_search_bloc.dart';
import 'package:ticketapp/views/event_widget_repo/views/event_widget.dart';

class EventSearchPage extends StatefulWidget {
  const EventSearchPage({Key? key}) : super(key: key);

  @override
  _EventSearchPageState createState() => _EventSearchPageState();
}

class _EventSearchPageState extends State<EventSearchPage> {
  final RefreshController refreshController = RefreshController();
  TextEditingController searchCon = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    searchCon.dispose();
    refreshController.dispose();
  }

  _onSearchTriggered(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (searchCon.text.isEmpty) {
      return;
    }
    // TODO: perform search here
    context.read<EventSearchBloc>().add(
          OnSearchTriggered(),
        );
  }

  Widget get _initialState {
    return BlocBuilder<EventSearchBloc, EventSearchModel>(
      builder: (context, state) {
        return ListView(
          padding: EdgeInsets.all(
            10.sp,
          ),
        );
      },
    );
  }

  Size get mediaQ {
    return MediaQuery.of(context).size;
  }

  Widget get _loadingState {
    return BlocBuilder<EventSearchBloc, EventSearchModel>(
      builder: (context, state) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[400]!,
          highlightColor: Colors.grey[300]!,
          child: ListView.separated(
            padding: EdgeInsets.all(10.sp),
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: mediaQ.width,
                height: 60.h,
                child: Row(
                  children: [
                    Container(
                      width: 60.sp,
                      height: 60.sp,
                      color: Colors.white,
                    ),
                    SizedBox(width: 15.w),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: mediaQ.width * .3,
                            height: 15.h,
                            color: Colors.white,
                          ),
                          SizedBox(height: 5.h),
                          Container(
                            width: (mediaQ.width * .3) +
                                (mediaQ.width * Random().nextDouble()),
                            height: 15.h,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
            itemCount: 15,
          ),
        );
      },
    );
  }

  Widget get _eventSearchFailedState {
    return SizedBox(
      width: mediaQ.width,
      height: mediaQ.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Search Failed',
            style: Theme.of(context).textTheme.caption,
          ),
          SizedBox(height: 15.h),
          ElevatedButton(
            onPressed: () {
              _onSearchTriggered(context);
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget get _paginationView {
    return BlocListener<EventSearchBloc, EventSearchModel>(
      listener: (context, state) {
        if (state.eventSearchState is EventLoadFailed) {
          refreshController.loadFailed();
        } else if (state.eventSearchState is EventLoadSuccess) {
          refreshController.loadComplete();
        } else if (state.eventSearchState is EventLoadNoData) {
          refreshController.loadNoData();
        }
      },
      child: BlocBuilder<EventSearchBloc, EventSearchModel>(
        builder: (context, state) {
          if (state.ticketMasterList.isEmpty) {
            return Container(
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
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            );
          }
          return SmartRefresher(
            enablePullDown: false,
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
            onRefresh: null,
            onLoading: () {
              context.read<EventSearchBloc>().add(
                    NextEventSearchPage(),
                  );
            },
            child: ListView.separated(
              padding: EdgeInsets.all(10.sp),
              itemBuilder: (BuildContext context, int index) {
                TicketMaster ticketMaster = state.ticketMasterList[index];
                // return ListTile(
                //   title: Text(
                //     ticketMaster.name,
                //   ),
                //   subtitle: Text(ticketMaster.type),
                // );
                return EventWidget(
                  ticketMaster: ticketMaster,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  color: Colors.transparent,
                );
              },
              itemCount: state.ticketMasterList.length,
            ),
          );
        },
      ),
    );
  }

  Widget _bodyContent(EventSearchModel state) {
    if (state.eventSearchState is EventSearchInitial) {
      return _initialState;
    } else if (state.eventSearchState is EventSearchRefreshing) {
      return _loadingState;
    } else if (state.eventSearchState is EventSearchFailed) {
      return _eventSearchFailedState;
    }
    return _paginationView;
    // return SizedBox(
    //   width: mediaQ.width,
    //   height: mediaQ.height,
    //   child: Center(
    //     child: Text(
    //       state.eventSearchState.toString(),
    //     ),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EventSearchBloc>(
      create: (context) => EventSearchBloc(),
      child: Builder(builder: (context) {
        return BlocBuilder<EventSearchBloc, EventSearchModel>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: TextFormField(
                  controller: searchCon,
                  autofocus: true,
                  onTap: () {
                    context.read<EventSearchBloc>().add(
                          OnFocusOnSearchField(),
                        );
                  },
                  onChanged: (String? val) {
                    context.read<EventSearchBloc>().add(
                          QueryStringChanges(
                            val: val ?? '',
                          ),
                        );
                  },
                  onEditingComplete:
                      state.eventSearchState is EventSearchInitial
                          ? () {
                              _onSearchTriggered(context);
                            }
                          : null,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search events',
                    suffixIcon: state.eventSearchState is EventSearchRefreshing
                        ? Container(
                            padding: EdgeInsets.all(5.sp),
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : IconButton(
                            onPressed: () {
                              _onSearchTriggered(context);
                            },
                            icon: Icon(
                              Icons.search,
                              color:
                                  state.eventSearchState is EventSearchInitial
                                      ? Colors.white
                                      : Colors.grey,
                            ),
                          ),
                  ),
                ),
              ),
              body: _bodyContent(state),
            );
          },
        );
      }),
    );
  }
}
