import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:dio/dio.dart';
import 'package:flutterando/app/modules/home/infra/datasources/partners_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/result_partners_model.dart';

class PartnersRemoteDatasource implements PartnersDatasource {
  final Dio dio;
  PartnersRemoteDatasource(this.dio);
  @override
  //'https://raw.githubusercontent.com/Flutterando/website/main/data/partners_data.json'
  Future<List<ResultPartnersModel>> getPartners() async {
    var url =
        'https://raw.githubusercontent.com/Flutterando/website/main/data/partners_data.json';
    var response = await dio.get(url);
    if (kDebugMode) {
      url =
          'https://raw.githubusercontent.com/Flutterando/website/main/data/partners_data.json';
    }
    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.data) as List;
      var listPartners =
          jsonList.map((e) => ResultPartnersModel.fromMap(e)).toList();
      return listPartners;
    }

    return <ResultPartnersModel>[];
  }
}
