
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterando/app/modules/home/infra/datasources/meetups_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/result_meetups_model.dart';

class MeetupsRemoteDatasource implements MeetupsDatasource {
  final Dio dio;

  MeetupsRemoteDatasource(this.dio);
  
  @override
  Future<List<ResultMeetupsModel>> getMeetups() async {
    var response = await dio.get('https://raw.githubusercontent.com/Flutterando/website/main/meetups_data.json?token=ADXZNKKKAWN5ZIUF3X7ZFPTAOIZCC');
    if(response.statusCode == 201) {
      var jsonList = jsonDecode(response.data) as List;
      var listMeetups = jsonList.map((e) => ResultMeetupsModel.fromMap(e)).toList();
      return listMeetups;
    }

    return <ResultMeetupsModel>[];
  }
}
