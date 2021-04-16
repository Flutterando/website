import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterando/app/modules/home/infra/datasources/youtube_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/result_youtube_model.dart';

class YoutubeRemoteDatasource implements YoutubeDatasource {
  final Dio dio;

  YoutubeRemoteDatasource(this.dio);
  
  @override
  Future<List<ResultYoutubeModel>> getYoutube() async {
    var response = await dio.get('https://raw.githubusercontent.com/Flutterando/website/main/youtube_data.json?token=ADXZNKLPMPY2A7LWB7UZMATAOOLA6');
    if(response.statusCode == 200) {
      var jsonList = jsonDecode(response.data) as List;
      var listYoutube = jsonList.map((e) => ResultYoutubeModel.fromMap(e)).toList();
      return listYoutube;
    }

    return <ResultYoutubeModel>[];
  }
}
