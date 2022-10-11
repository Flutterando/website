import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_meetups.dart';
import 'package:flutterando/app/modules/home/external/mappers/result_meetups_mapper.dart';
import 'package:flutterando/app/modules/home/infra/datasources/meetups_datasource.dart';

class MeetupsRemoteDatasource implements MeetupsDatasource {
  final Dio dio;

  MeetupsRemoteDatasource(this.dio);

  @override
  Future<List<ResultMeetups>> getMeetups() async {
    var url =
        'https://raw.githubusercontent.com/Flutterando/website/main/data/meetups_data.json';

    var response = await dio.get(url);

    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.data) as List;

      var listMeetups =
          jsonList.map((e) => ResultMeetupsMapper.fromMap(e)).toList();

      return listMeetups;
    }

    return <ResultMeetups>[];
  }
}
