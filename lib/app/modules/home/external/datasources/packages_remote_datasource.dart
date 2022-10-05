import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterando/app/modules/home/infra/datasources/packages_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/result_packages_model.dart';

class PackagesRemoteDatasource implements PackagesDatasource {
  final Dio dio;
  PackagesRemoteDatasource(this.dio);
  @override
  Future<List<ResultPackagesModel>> getPackages() async {
    var response = await dio.get(
        'https://raw.githubusercontent.com/Flutterando/website/main/data/packages_data.json');
    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.data) as List;
      var listPackages =
          jsonList.map((e) => ResultPackagesModel.fromMap(e)).toList();
      return listPackages;
    }

    return <ResultPackagesModel>[];
  }
}
