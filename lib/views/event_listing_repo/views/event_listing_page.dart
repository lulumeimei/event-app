import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketapp/views/event_listing_repo/bloc/event_listing_bloc.dart';

class EventListingPage extends StatefulWidget {
  const EventListingPage({Key? key}) : super(key: key);

  @override
  _EventListingPageState createState() => _EventListingPageState();
}

class _EventListingPageState extends State<EventListingPage> {
  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  @override
  void dispose() {
    super.dispose();
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
          body: SizedBox(
            width: mediaQ.width,
            height: mediaQ.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  state.eventListingState.toString(),
                ),
                Text(
                  state.curPage.toString() + ' page',
                ),
                ElevatedButton(
                  onPressed: _refreshData,
                  child: const Text(
                    'Refresh',
                  ),
                ),
                ElevatedButton(
                  onPressed: _loadData,
                  child: const Text(
                    'Load',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
