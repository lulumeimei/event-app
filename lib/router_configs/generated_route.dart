import 'package:flutter/material.dart';
import 'package:ticketapp/router_configs/app_routes.dart';
import 'package:ticketapp/views/dashboard_repo/views/dashboard_page.dart';
import 'package:ticketapp/views/event_detail_repo/index.dart';
import 'package:ticketapp/views/event_detail_repo/views/event_detail_page.dart';
import 'package:ticketapp/views/event_listing_repo/params/event_listing_page_params.dart';
import 'package:ticketapp/views/event_listing_repo/views/event_listing_page.dart';
import 'package:ticketapp/views/event_search_repo/views/event_search_page.dart';

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
        return const DashboardPage();
      case AppRoutes.EVENT_LISTING_PAGE:
        return EventListingPage(
          eventListingPageParams: settings.arguments as EventListingPageParams,
        );
      case AppRoutes.EVENT_DETAIL_PAGE:
        return EventDetailPage(
          eventDetailParams: settings.arguments as EventDetailParams,
        );
      case AppRoutes.EVENT_SEARCH_PAGE:
        return const EventSearchPage();
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
