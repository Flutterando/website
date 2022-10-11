import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_package.dart';
import 'package:flutterando/app/modules/home/external/mappers/result_packages_mapper.dart';
import 'package:flutterando/app/modules/home/infra/datasources/packages_datasource.dart';

class PackagesRemoteDatasource implements PackagesDatasource {
  final Dio dio;
  PackagesRemoteDatasource(this.dio);
  @override
  Future<List<ResultPackage>> getPackages() async {
    var url = 'https://raw.githubusercontent.com/Flutterando/website/main/data/packages_data.json';
    var response = await dio.get(url);

    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.data) as List;
      var listPackages = jsonList.map((e) => ResultPackagesMapper.fromMap(e)).toList();
      listPackages.shuffle();
      return listPackages;
    }

    return <ResultPackage>[];
  }
}
