import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterando/app/modules/home/infra/datasources/youtube_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/result_youtube_model.dart';

class YoutubeRemoteDatasource implements YoutubeDatasource {
  final Dio dio;

  YoutubeRemoteDatasource(this.dio);
  
  @override
  Future<List<ResultYoutubeModel>> getYoutube() async {
    var response = await dio.get('https://raw.githubusercontent.com/Flutterando/website/tree/main/data/youtube_data.json');
    if(response.statusCode == 200) {
      var jsonList = jsonDecode(response.data) as List;
      var listYoutube = jsonList.map((e) => ResultYoutubeModel.fromMap(e)).toList();
      return listYoutube;
    }

    return <ResultYoutubeModel>[];
  }
}
