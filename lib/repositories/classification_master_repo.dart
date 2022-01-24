// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'package:ticketapp/configs/app_config.dart';
import 'package:ticketapp/models/index.dart';

abstract class ClassificationMasterRepoInterface {
  factory ClassificationMasterRepoInterface() => ClassificationMasterRepo();

  Future<List<ClassificationMaster>> classificationMasterList();
  Future<ClassificationMaster> getSpecifiClassificationMaster(
      {required String id});
}

class ClassificationMasterRepo implements ClassificationMasterRepoInterface {
  ClassificationMasterRepo();

  static const GET_CLASSIFICATION_MASTER_PATH = '/classifications.json';

  @override
  Future<List<ClassificationMaster>> classificationMasterList() async {
    Dio dio = appConfigInterface.getDio();
    Response response = await dio.get(
      ClassificationMasterRepo.GET_CLASSIFICATION_MASTER_PATH,
    );
    List<ClassificationMaster> classificationMasterList = [];
    for (Map<String, dynamic> map
        in response.data['_embedded']?['classifications'] ?? []) {
      ClassificationMaster classificationMaster =
          ClassificationMaster.fromJson(map);
      classificationMasterList.add(classificationMaster);
    }
    return classificationMasterList;
  }

  @override
  Future<ClassificationMaster> getSpecifiClassificationMaster(
      {required String id}) async {
    Dio dio = appConfigInterface.getDio();
    Response response = await dio.get(
      ClassificationMasterRepo.GET_CLASSIFICATION_MASTER_PATH + '/$id',
    );
    ClassificationMaster classificationMaster = ClassificationMaster.fromJson(
      response.data,
    );
    return classificationMaster;
  }
}
