// ignore_for_file: constant_identifier_names

import 'dart:convert';
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
    String? keyword,
  });
  Future<TicketMaster> getSpecificTicketMaster({required String id});
}

class TicketMasterRepo implements TicketMasterRepoInterface {
  TicketMasterRepo();

  static const GET_EVENT_LIST_PATH = '/events.json';
  static const GET_SPECIFIC_EVENT_PATH = '/events';

  // queries
  static const CLASSIFICATION_ID = 'classificationId';
  static const KEYWORD = 'keyword';

  @override
  Future<List<TicketMaster>> getTicketMasterList({
    int? size,
    required int page,
    String? classificationId,
    String? keyword,
  }) async {
    Map<String, dynamic> queries = {
      'size': size,
      'page': page,
      TicketMasterRepo.CLASSIFICATION_ID: classificationId,
      TicketMasterRepo.KEYWORD: keyword,
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

  @override
  Future<TicketMaster> getSpecificTicketMaster({required String id}) async {
    Dio dio = appConfigInterface.getDio();
    Response response =
        await dio.get(TicketMasterRepo.GET_SPECIFIC_EVENT_PATH + '/$id');
    TicketMaster ticketMaster = TicketMaster.fromJson(jsonDecode(
      response.data,
    ));
    return ticketMaster;
  }
}
