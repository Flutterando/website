import 'package:flutterando/app/modules/home/infra/models/result_youtube_model.dart';

abstract class YoutubeDatasource {
  Future<List<ResultYoutubeModel>> getYoutube();
}
