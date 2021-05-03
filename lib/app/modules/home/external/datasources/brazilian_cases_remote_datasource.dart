import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterando/app/modules/home/infra/datasources/brazilian_cases_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/result_brazilian_cases_model.dart';

class BrazilianCasesRemoteDatasource implements BrazilianCasesDatasource {
  final Dio dio;
  // final BrazilianCasesData brazilianCases;
  BrazilianCasesRemoteDatasource(this.dio);

  @override
  Future<List<ResultBrazilianCasesModel>> getBrazilianCases() async {
    var response = await dio.get('https://raw.githubusercontent.com/Flutterando/website/tree/main/data/brazilian_cases_data.json');
    if(response.statusCode == 200) {
      var jsonList = jsonDecode(response.data) as List;
      var listBrazilianCases = jsonList.map((e) => ResultBrazilianCasesModel.fromMap(e)).toList();
      return listBrazilianCases;
    }

    return <ResultBrazilianCasesModel>[];
  }
}
