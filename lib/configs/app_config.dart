import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

late AppConfigInterface appConfigInterface;

abstract class AppConfigInterface {
  factory AppConfigInterface({
    required bool isDev,
  }) {
    if (isDev) {
      // change to dev env
      return AppConfig.dev();
    }
    // change to prod env
    return AppConfig.prod();
  }

  bool get isDevEnv;
  Dio getDio({Map<String, dynamic>? queries});
}

class AppConfig extends Equatable implements AppConfigInterface {
  final String domain;
  final String apiVersion;
  final String apiKey = 'N2Mz4dirw4gVbxMLWiesTTTfjt1mX3vv';

  const AppConfig({
    required this.domain,
    required this.apiVersion,
  });

  @override
  List<Object?> get props => [
        domain,
        apiVersion,
      ];

  factory AppConfig.prod() {
    return const AppConfig(
      domain: 'https://app.ticketmaster.com',
      apiVersion: '/discovery/v2',
    );
  }

  factory AppConfig.dev() {
    return const AppConfig(
      domain: 'https://app.ticketmaster.com',
      apiVersion: '/discovery/v2',
    );
  }

  @override
  bool get isDevEnv {
    if (this == AppConfig.dev()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Dio getDio({Map<String, dynamic>? queries}) {
    Map<String, dynamic> defaultQueries = {
      'apikey': apiKey,
    };
    if (queries != null) {
      defaultQueries.addAll(queries);
    }
    BaseOptions baseOptions = BaseOptions(
      baseUrl: domain + apiVersion,
      queryParameters: defaultQueries,
    );
    Dio dio = Dio(baseOptions);
    if (kReleaseMode == false) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: false,
          requestBody: false,
          responseBody: false,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
    }
    return dio;
  }
}
