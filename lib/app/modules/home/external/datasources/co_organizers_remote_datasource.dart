import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterando/app/modules/home/infra/datasources/co_organizers_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/result_co_organizers_model.dart';

class CoOrganizersRemoteDatasource implements CoOrganizersDatasource {
  final Dio dio;
  
  CoOrganizersRemoteDatasource(this.dio);

  @override
  Future<List<ResultCoOrganizersModel>> getCoOrganizers() async {
    var response = await dio.get('https://raw.githubusercontent.com/Flutterando/website/main/coorganizers_data.json?token=ADXZNKLXIEPR3TS3IBEWGVDAPTDYY');
    if(response.statusCode == 200) {
      var jsonList = jsonDecode(response.data) as List;
      var listCoOrganizers = jsonList.map((e) => ResultCoOrganizersModel.fromMap(e)).toList();
      return listCoOrganizers;
    }

    return <ResultCoOrganizersModel>[];
  }
}
