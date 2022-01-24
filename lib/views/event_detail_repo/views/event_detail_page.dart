import 'package:flutter/material.dart';
import 'package:ticketapp/models/index.dart';
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
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
