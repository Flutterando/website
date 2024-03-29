import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_youtube.dart';
import 'package:flutterando/app/modules/home/external/mappers/result_youtube_mapper.dart';
import 'package:flutterando/app/modules/home/infra/datasources/youtube_datasource.dart';

class YoutubeRemoteDatasource implements YoutubeDatasource {
  final Dio dio;

  YoutubeRemoteDatasource(this.dio);
  @override
  Future<List<ResultYoutube>> getYoutube() async {
    var url = 'https://raw.githubusercontent.com/Flutterando/website/main/data/youtube_data.json';
    var response = await dio.get(url);

    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.data) as List;
      var listYoutube = jsonList.map((e) => ResultYoutubeMapper.fromMap(e)).toList();
      return listYoutube;
    }

    return <ResultYoutube>[];
  }
}
