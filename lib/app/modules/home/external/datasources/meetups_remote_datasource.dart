import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterando/app/modules/home/infra/datasources/meetups_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/result_meetups_model.dart';

class MeetupsRemoteDatasource implements MeetupsDatasource {
  final Dio dio;

  MeetupsRemoteDatasource(this.dio);
  //'https://raw.githubusercontent.com/Flutterando/website/main/data/meetups_data.json'

  @override
  Future<List<ResultMeetupsModel>> getMeetups() async {
    var url = 'https://raw.githubusercontent.com/Flutterando/website/main/data/meetups_data.json';

    var response = await dio.get(url);

    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.data) as List;
      var listMeetups = jsonList.map((e) => ResultMeetupsModel.fromMap(e)).toList();
      listMeetups.shuffle();
      return listMeetups;
    }

    return <ResultMeetupsModel>[];
  }
}
