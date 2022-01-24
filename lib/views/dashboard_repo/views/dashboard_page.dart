import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ticketapp/router_configs/app_routes.dart';
import 'package:ticketapp/views/classification_master_listing_repo/views/classification_master_listing_widget.dart';
import 'package:ticketapp/views/dashboard_repo/bloc/dashboard_bloc.dart';
import 'package:ticketapp/views/dashboard_repo/widgets/event_listing_carousel.dart';
import 'package:ticketapp/views/event_listing_repo/params/event_listing_page_params.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    _loadDashboard();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _loadDashboard() {
    context.read<DashboardBloc>().add(
          LoadEvents(),
        );
  }

  AppBar get _appBar {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_border_outlined,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search_outlined,
          ),
        )
      ],
    );
  }

  Size get mediaQ {
    return MediaQuery.of(context).size;
  }

  Widget get _drawer {
    return Card(
      margin: EdgeInsets.zero,
      child: SizedBox(
        width: mediaQ.width * .65,
        height: mediaQ.height,
      ),
    );
  }

  Widget get _bodyContent {
    double buttonHeight = 560.h;
    double buttonWidth = 300.w;
    RoundedRectangleBorder eventButtonShape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(
          12,
        ),
      ),
    );
    List<Widget> widgetlist = [];

    // header widget
    Widget classificationOptionWidget = SizedBox(
      width: mediaQ.width,
      child: const ClassificationMasterListingWidget(),
    );

    Widget titleWidget = Container(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 5,
      ),
      width: mediaQ.width,
      child: BlocBuilder<DashboardBloc, DashboardModel>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    state.selectedClassificationMaster != null
                        ? state.selectedClassificationMaster!
                                .classificationMasterSegment?.name ??
                            ''
                        : "All",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              if (state.dashboardState is DashboardLoaded)
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.EVENT_LISTING_PAGE,
                      arguments: EventListingPageParams(
                        page: state.page,
                        perPage: state.perPage,
                        selectedClassificationMaster:
                            state.selectedClassificationMaster,
                        ticketMasterList: state.ticketMasterList,
                      ),
                    );
                  },
                  child: const Text(
                    'Show All',
                  ),
                ),
            ],
          );
        },
      ),
    );

    Widget eventListingWidget = BlocBuilder<DashboardBloc, DashboardModel>(
      builder: (context, state) {
        if (state.dashboardState is DashboardInitial) {
          return Container(
            padding: const EdgeInsets.all(10),
            width: mediaQ.width,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[400]!,
              highlightColor: Colors.grey[300]!,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    6,
                    (index) => Card(
                      shape: eventButtonShape,
                      child: SizedBox(
                        width: buttonWidth,
                        height: buttonHeight,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        if (state.dashboardState is DashboardError) {
          return SizedBox(
            width: mediaQ.width,
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Error",
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: _loadDashboard,
                  child: const Text(
                    "Retry",
                  ),
                ),
              ],
            ),
          );
        }
        if (state.dashboardState is DashboardLoaded ||
            state.dashboardState is DashboardLoading ||
            state.dashboardState is DashboardNextPageFailed) {
          if (state.ticketMasterList.isEmpty) {
            return SizedBox(
              width: mediaQ.width,
              height: buttonHeight,
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
                    'Ops. No events under ${state.selectedClassificationMaster?.classificationMasterSegment?.name ?? '-'}',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            );
          }
          return EventListingCarouselWidget(
            width: buttonWidth,
            height: buttonHeight,
            ticketMasterList: state.ticketMasterList,
          );
        }

        return SizedBox(
          width: mediaQ.width,
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text(state.dashboardState.toString())],
          ),
        );
      },
    );

    widgetlist = [
      classificationOptionWidget,
      titleWidget,
      SizedBox(height: 10.h),
      eventListingWidget,
    ];

    return SizedBox(
      width: mediaQ.width,
      height: mediaQ.height,
      child: ListView(
        children: widgetlist,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      drawer: _drawer,
      body: _bodyContent,
    );
  }
}
