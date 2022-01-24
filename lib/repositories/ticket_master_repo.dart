// ignore_for_file: constant_identifier_names

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ticketapp/configs/app_config.dart';
import 'package:ticketapp/models/index.dart';

abstract class TicketMasterRepoInterface {
  factory TicketMasterRepoInterface() => TicketMasterRepo();

  Future<List<TicketMaster>> getTicketMasterList({
    int? size,
    required int page,
    String? classificationId,
  });
}

class TicketMasterRepo implements TicketMasterRepoInterface {
  TicketMasterRepo();

  static const GET_EVENT_LIST_PATH = '/events.json';

  // queries
  static const CLASSIFICATION_ID = 'classificationId';

  @override
  Future<List<TicketMaster>> getTicketMasterList({
    int? size,
    required int page,
    String? classificationId,
  }) async {
    Map<String, dynamic> queries = {
      'size': size,
      'page': page,
      TicketMasterRepo.CLASSIFICATION_ID: classificationId,
    };
    queries.removeWhere((key, value) => value == null);
    Dio dio = appConfigInterface.getDio(
      queries: queries,
    );
    Response response = await dio.get(
      TicketMasterRepo.GET_EVENT_LIST_PATH,
    );
    List<TicketMaster> ticketMasterList = [];
    for (Map<String, dynamic> map
        in response.data?['_embedded']?['events'] ?? []) {
      try {
        TicketMaster ticketMaster = TicketMaster.fromJson(map);
        ticketMasterList.add(ticketMaster);
      } catch (e) {
        log('decode ticket master model failed. $e');
      }
    }
    return ticketMasterList;
  }
}
