import 'package:flutterando/app/modules/home/domain/entities/result_youtube.dart';

abstract class YoutubeDatasource {
  Future<List<ResultYoutube>> getYoutube();
}
