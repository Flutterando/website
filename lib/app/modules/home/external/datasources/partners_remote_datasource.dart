import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_partners.dart';
import 'package:flutterando/app/modules/home/external/mappers/result_partners_mapper.dart';
import 'package:flutterando/app/modules/home/infra/datasources/partners_datasource.dart';

class PartnersRemoteDatasource implements PartnersDatasource {
  final Dio dio;
  PartnersRemoteDatasource(this.dio);
  @override
  Future<List<ResultPartners>> getPartners() async {
    var url = 'https://raw.githubusercontent.com/Flutterando/website/main/data/partners_data.json';
    var response = await dio.get(url);

    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.data) as List;
      var listPartners = jsonList.map((e) => ResultPartnersMapper.fromMap(e)).toList();
      listPartners.shuffle();
      return listPartners;
    }

    return <ResultPartners>[];
  }
}
