import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:dio/dio.dart';
import 'package:flutterando/app/modules/home/infra/datasources/youtube_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/result_youtube_model.dart';

class YoutubeRemoteDatasource implements YoutubeDatasource {
  final Dio dio;

  YoutubeRemoteDatasource(this.dio);
  //'https://raw.githubusercontent.com/Flutterando/website/main/data/youtube_data.json'
  @override
  Future<List<ResultYoutubeModel>> getYoutube() async {
    var url =
        'https://raw.githubusercontent.com/Titoomf/website/features/website/data/youtube_data.json';
    var response = await dio.get(url);
    if (kDebugMode) {
      url =
          'https://raw.githubusercontent.com/Titoomf/website/features/website/data/youtube_data.json';
    }
    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.data) as List;
      var listYoutube =
          jsonList.map((e) => ResultYoutubeModel.fromMap(e)).toList();
      return listYoutube;
    }

    return <ResultYoutubeModel>[];
  }
}
