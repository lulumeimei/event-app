import 'dart:developer';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticketapp/configs/app_config.dart';
import 'package:ticketapp/router_configs/app_routes.dart';
import 'package:ticketapp/router_configs/generated_route.dart';
import 'package:ticketapp/views/dashboard_repo/bloc/dashboard_bloc.dart';
import 'package:ticketapp/views/index.dart';

import 'configs/bloc_observer.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(
      const MyApp(),
    ),
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initEnv();
  }

  @override
  void dispose() {
    super.dispose();
  }

  initEnv() {
    // set environment here
    appConfigInterface = kReleaseMode ? AppConfig.prod() : AppConfig.dev();
    if (appConfigInterface.isDevEnv) {
      log('Loaded development environment');
    } else {
      log('Loaded product environment');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ClassificationMasterListingBloc>(
          create: (context) => ClassificationMasterListingBloc(),
        ),
        BlocProvider<DashboardBloc>(
          create: (context) => DashboardBloc(
            // can change event listing per page here,
            // default to 20
            perPage: 20,
          ),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () {
          return MaterialApp(
            title: 'Event Preview App',
            theme: FlexThemeData.light(scheme: FlexScheme.mandyRed).copyWith(
              scaffoldBackgroundColor: const Color(0xffF1F1F1),
            ),
            // The Mandy red, dark theme.
            darkTheme: FlexThemeData.dark(scheme: FlexScheme.mandyRed),
            themeMode: ThemeMode.dark,
            onGenerateRoute: generatedRoute,
            initialRoute: AppRoutes.INITIAL_ROUTE,
          );
        },
      ),
    );
  }
}
