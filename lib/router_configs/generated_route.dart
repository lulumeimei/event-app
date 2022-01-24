import 'package:flutter/material.dart';
import 'package:ticketapp/router_configs/app_routes.dart';
import 'package:ticketapp/views/event_detail_repo/index.dart';
import 'package:ticketapp/views/event_detail_repo/views/event_detail_page.dart';
import 'package:ticketapp/views/event_listing_repo/views/event_listing_page.dart';

Route<dynamic> generatedRoute(RouteSettings settings) {
  final parts = settings.name!.split('?');
  String pageName = parts[0];

  // var arguments;
  // try {
  //   arguments =
  //       parts.length == 2 ? Uri.splitQueryString(parts[1]) : settings.arguments;
  // } catch (e) {
  //   arguments = settings.arguments;
  // }
  RouteSettings routeSettings = RouteSettings(
    name: settings.name,
    arguments: settings.arguments,
  );

  Widget getPage() {
    switch (pageName) {
      case AppRoutes.INITIAL_ROUTE:
        return const EventListingPage();
      case AppRoutes.EVENT_DETAIL_PAGE:
        return EventDetailPage(
          eventDetailParams: settings.arguments as EventDetailParams,
        );
      default:
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('Undefined page'),
          ),
        );
    }
  }

  return MaterialPageRoute(
    settings: routeSettings,
    builder: (_) => getPage(),
  );
}
