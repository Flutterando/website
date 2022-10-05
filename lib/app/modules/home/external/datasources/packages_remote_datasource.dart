import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:dio/dio.dart';
import 'package:flutterando/app/modules/home/infra/datasources/packages_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/result_packages_model.dart';

class PackagesRemoteDatasource implements PackagesDatasource {
  final Dio dio;
  PackagesRemoteDatasource(this.dio);
  @override

  //https://raw.githubusercontent.com/Flutterando/website/main/data/packages_data.json
  Future<List<ResultPackagesModel>> getPackages() async {
    var url =
        'https://raw.githubusercontent.com/Flutterando/website/main/data/packages_data.json';
    var response = await dio.get(url);
    if (kDebugMode) {
      url =
          'https://raw.githubusercontent.com/Flutterando/website/main/data/packages_data.json';
    }
    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.data) as List;
      var listPackages =
          jsonList.map((e) => ResultPackagesModel.fromMap(e)).toList();
      return listPackages;
    }

    return <ResultPackagesModel>[];
  }
}
