import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_brazilian_cases.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_followers_numbers.dart';
import 'package:flutterando/app/modules/home/external/mappers/result_brazilian_cases_mapper.dart';
import 'package:flutterando/app/modules/home/infra/datasources/brazilian_cases_datasource.dart';

class BrazilianCasesRemoteDatasource implements BrazilianCasesDatasource {
  final Dio dio;
  BrazilianCasesRemoteDatasource(this.dio);

  @override
  Future<List<ResultBrazilianCases>> getBrazilianCases() async {
    var url = 'https://raw.githubusercontent.com/Flutterando/website/main/data/brazilian_cases_data.json';

    var response = await dio.get(url);

    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.data) as List;
      var listBrazilianCases = jsonList.map((e) => ResultBrazilianCasesMapper.fromMap(e)).toList();
      listBrazilianCases.shuffle();
      return listBrazilianCases;
    }

    return <ResultBrazilianCases>[];
  }

  @override
  Future<ResultFollowers> getFolowers() async {
    var url = 'https://raw.githubusercontent.com/Flutterando/website/main/data/followers_number.json';

    var response = await dio.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.data);
      return ResultFollowers(
        youtube: data['youtube'],
        instagram: data['instagram'],
        twitter: data['twitter'],
        discord: data['discord'],
        telegram: data['telegram'],
        facebook: data['facebook'],
        linkedin: data['linkedin'],
      );
    }

    return ResultFollowers(
      youtube: '',
      instagram: '',
      twitter: '',
      discord: '',
      telegram: '',
      facebook: '',
      linkedin: '',
    );
  }
}
