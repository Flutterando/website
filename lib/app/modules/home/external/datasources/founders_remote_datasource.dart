import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:dio/dio.dart';
import 'package:flutterando/app/modules/home/infra/datasources/founders_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/result_founders_model.dart';

class FoundersRemoteDatasource implements FoundersDatasource {
  final Dio dio;

  FoundersRemoteDatasource(this.dio);

  @override
  Future<List<ResultFoundersModel>> getFounders() async {
    var listFounders = <ResultFoundersModel>[];

    var url =
        'https://raw.githubusercontent.com/Titoomf/website/features/website/data/founders_data.json';
    // 'https://raw.githubusercontent.com/Flutterando/website/main/data/founders_data.json'
    var response = await dio.get(url);
    if (kDebugMode) {
      url =
          'https://raw.githubusercontent.com/Titoomf/website/features/website/data/founders_data.json';
    }
    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.data) as List;
      listFounders =
          jsonList.map((e) => ResultFoundersModel.fromMap(e)).toList();
    }

    return listFounders;
  }
}
