import 'package:dio/dio.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_youtube.dart';
import 'package:flutterando/app/modules/home/external/mappers/result_youtube_mapper.dart';
import 'package:flutterando/app/modules/home/infra/datasources/youtube_datasource.dart';

import '../../../../utils/shared/constants_api.dart';

class YoutubeRemoteDatasource implements YoutubeDatasource {
  final Dio dio;

  YoutubeRemoteDatasource(this.dio);
  Future<List<ResultYoutube>> getYoutube() async {
    var response = await dio.get(ConstantsApiUrls.getSearch, queryParameters: {
      'key': ConstantsApiUrls.apiKey,
      'part': 'snippet',
      'channelId': 'UCplT2lzN6MHlVHHLt6so39A',
      'maxResults': 10,
      'order': 'date',
    });

    if (response.statusCode == 200) {
      var jsonList = response.data['items'];
      var listYoutube =
          jsonList.map((e) => ResultYoutubeMapper.fromMap(e)).toList();
      final parsedList = List.castFrom<dynamic, ResultYoutube>(listYoutube);
      return parsedList;
    }

    return <ResultYoutube>[];
  }
}
