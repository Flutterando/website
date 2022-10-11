import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_founders.dart';
import 'package:flutterando/app/modules/home/external/mappers/result_founders_mapper.dart';
import 'package:flutterando/app/modules/home/infra/datasources/founders_datasource.dart';

class FoundersRemoteDatasource implements FoundersDatasource {
  final Dio dio;

  FoundersRemoteDatasource(this.dio);

  @override
  Future<List<ResultFounders>> getFounders() async {
    var listFounders = <ResultFounders>[];

    var url = 'https://raw.githubusercontent.com/Flutterando/website/main/data/founders_data.json';
    var response = await dio.get(url);

    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.data) as List;
      listFounders = jsonList.map((e) => ResultFoundersMapper.fromMap(e)).toList();
    }

    return listFounders;
  }
}
