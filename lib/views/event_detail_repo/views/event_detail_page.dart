import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketapp/views/event_detail_repo/bloc/event_detail_bloc.dart';
import 'package:ticketapp/views/event_detail_repo/params/event_detail_params.dart';

class EventDetailPage extends StatefulWidget {
  final EventDetailParams eventDetailParams;
  const EventDetailPage({
    Key? key,
    required this.eventDetailParams,
  }) : super(key: key);

  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  late final EventDetailBloc eventDetailBloc = EventDetailBloc(
    id: widget.eventDetailParams.id,
    ticketMaster: widget.eventDetailParams.ticketMaster,
  );
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    super.dispose();
    eventDetailBloc.close();
  }

  _loadData() {
    eventDetailBloc.add(
      LoadEventDetail(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EventDetailBloc>(
      create: (context) => eventDetailBloc,
      child: BlocBuilder<EventDetailBloc, EventDetailModel>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text(
                state.eventDetailState.toString(),
              ),
            ),
          );
        },
      ),
    );
  }
}
