import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:dio/dio.dart';

import 'package:flutterando/app/modules/home/infra/datasources/co_organizers_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/result_co_organizers_model.dart';

class CoOrganizersRemoteDatasource implements CoOrganizersDatasource {
  final Dio dio;

  CoOrganizersRemoteDatasource(this.dio);

  @override
  Future<List<ResultCoOrganizersModel>> getCoOrganizers() async {
    var url =
        'https://raw.githubusercontent.com/Titoomf/website/features/website/data/coorganizers_data.json';
    // 'https://raw.githubusercontent.com/Flutterando/website/main/data/coorganizers_data.json';
    var response = await dio.get(url);
    if (kDebugMode) {
      url =
          'https://raw.githubusercontent.com/Titoomf/website/features/website/data/coorganizers_data.json';
    }
    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.data) as List;
      var listCoOrganizers =
          jsonList.map((e) => ResultCoOrganizersModel.fromMap(e)).toList();
      return listCoOrganizers;
    }

    return <ResultCoOrganizersModel>[];
  }
}
