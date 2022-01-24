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

  Widget get _loadedWidget {
    List<Widget> widgetlist = [];

    // header widget
    Widget classificationOptionWidget = SizedBox(
      width: mediaQ.width,
      child: const ClassificationMasterListingWidget(),
    );

    widgetlist = [
      classificationOptionWidget,
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
      body: BlocBuilder<DashboardBloc, DashboardModel>(
        builder: (context, state) {
          if (state.dashboardState is DashboardInitial) {
            return const CircularProgressIndicator();
          }
          if (state.dashboardState is DashboardError) {
            return SizedBox(
              width: mediaQ.width,
              height: mediaQ.height,
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
            return _loadedWidget;
          }
          return SizedBox(
            width: mediaQ.width,
            height: mediaQ.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text(state.dashboardState.toString())],
            ),
          );
        },
      ),
    );
  }
}
