import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_co_organizers.dart';
import 'package:flutterando/app/modules/home/external/mappers/result_co_organizers_mapper.dart';
import 'package:flutterando/app/modules/home/infra/datasources/co_organizers_datasource.dart';

class CoOrganizersRemoteDatasource implements CoOrganizersDatasource {
  final Dio dio;

  CoOrganizersRemoteDatasource(this.dio);

  @override
  Future<List<ResultCoOrganizers>> getCoOrganizers() async {
    var url = 'https://raw.githubusercontent.com/Flutterando/website/main/data/coorganizers_data.json';

    var response = await dio.get(url);

    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.data) as List;
      var listCoOrganizers = jsonList.map((e) => ResultCoOrganizersMapper.fromMap(e)).toList();
      listCoOrganizers.shuffle();
      return listCoOrganizers;
    }

    return <ResultCoOrganizers>[];
  }
}
