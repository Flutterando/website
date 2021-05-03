import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterando/app/modules/home/infra/datasources/partners_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/result_partners_model.dart';

class PartnersRemoteDatasource implements PartnersDatasource {
  final Dio dio;
  PartnersRemoteDatasource(this.dio);
  @override
  Future<List<ResultPartnersModel>> getPartners() async {
    var response = await dio.get('https://raw.githubusercontent.com/Flutterando/website/main/data/partners_data.json');
    print(response.data);
    if(response.statusCode == 200) {
      var jsonList = jsonDecode(response.data) as List;
      var listPartners = jsonList.map((e) => ResultPartnersModel.fromMap(e)).toList();
      return listPartners;
    }

    return <ResultPartnersModel>[];
  }
}
