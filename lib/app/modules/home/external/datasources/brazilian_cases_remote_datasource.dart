import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_folowers_numbers.dart';
import 'package:flutterando/app/modules/home/infra/datasources/brazilian_cases_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/result_brazilian_cases_model.dart';

class BrazilianCasesRemoteDatasource implements BrazilianCasesDatasource {
  final Dio dio;
  BrazilianCasesRemoteDatasource(this.dio);

  @override
  Future<List<ResultBrazilianCasesModel>> getBrazilianCases() async {
    var url = 'https://raw.githubusercontent.com/Flutterando/website/main/data/brazilian_cases_data.json';

    var response = await dio.get(url);

    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.data) as List;
      var listBrazilianCases = jsonList.map((e) => ResultBrazilianCasesModel.fromMap(e)).toList();
      return listBrazilianCases;
    }

    return <ResultBrazilianCasesModel>[];
  }

  @override
  Future<ResultFolowers> getFolowers() async {
    var url = 'https://raw.githubusercontent.com/Flutterando/website/main/data/followers_number.json';

    var response = await dio.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.data);
      return ResultFolowers(data['youtube'], data['instagram'], data['twitter'], data['discord'], data['telegram'], data['facebook']);
    }

    return ResultFolowers('0', '0', '0', '0', '0', '0');
  }
}
