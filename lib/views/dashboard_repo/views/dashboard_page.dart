import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketapp/views/classification_master_listing_repo/views/classification_master_listing_widget.dart';
import 'package:ticketapp/views/dashboard_repo/bloc/dashboard_bloc.dart';

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
              TextButton(
                onPressed: () {},
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
            child: const Center(
              child: CircularProgressIndicator(),
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
        if (state.dashboardState is DashboardLoaded) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 6),
            clipBehavior: Clip.none,
            child: Row(
              children: state.ticketMasterList.map(
                (e) {
                  RoundedRectangleBorder eventButtonShape =
                      const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        12,
                      ),
                    ),
                  );
                  double buttonHeight = 600;
                  double buttonWidth = 300;
                  return Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: MaterialButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      color: Theme.of(context).cardColor,
                      shape: eventButtonShape,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            12,
                          ),
                        ),
                        child: SizedBox(
                          width: buttonWidth,
                          height: buttonHeight,
                          child: Column(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  width: mediaQ.width,
                                  child: e.ticketImageList.isNotEmpty
                                      ? Image.network(
                                          e.ticketImageList.first.url,
                                          fit: BoxFit.cover,
                                        )
                                      : const Placeholder(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
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
