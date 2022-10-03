import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:dio/dio.dart';
import 'package:flutterando/app/modules/home/infra/datasources/brazilian_cases_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/result_brazilian_cases_model.dart';

class BrazilianCasesRemoteDatasource implements BrazilianCasesDatasource {
  final Dio dio;
  BrazilianCasesRemoteDatasource(this.dio);

  @override
  Future<List<ResultBrazilianCasesModel>> getBrazilianCases() async {
    //  var response = await dio.get('https://raw.githubusercontent.com/Flutterando/website/main/data/brazilian_cases_data.json');
    var url =
        'https://raw.githubusercontent.com/Titoomf/website/features/website/data/brazilian_cases_data.json';
    // 'https://raw.githubusercontent.com/Titoomf/website/features/website/data/brazilian_cases_data.json';

    var response = await dio.get(url);
    if (kDebugMode) {
      url =
          'https://raw.githubusercontent.com/Titoomf/website/features/website/data/brazilian_cases_data.json';
    }
    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.data) as List;
      var listBrazilianCases =
          jsonList.map((e) => ResultBrazilianCasesModel.fromMap(e)).toList();
      return listBrazilianCases;
    }

    return <ResultBrazilianCasesModel>[];
  }
}
