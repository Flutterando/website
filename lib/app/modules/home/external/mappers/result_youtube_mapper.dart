import 'dart:convert';

import 'package:flutterando/app/modules/home/domain/entities/result_youtube.dart';

class ResultYoutubeMapper {
  Map<String, dynamic> toMap(ResultYoutube resultYoutube) {
    return {
      'imgUrl': resultYoutube.imgUrl,
      'title': resultYoutube.title,
      'linkUrl': resultYoutube.linkUrl,
      'date': resultYoutube.date.toString(),
    };
  }

  static ResultYoutube fromMap(Map<String, dynamic> map) {
    return ResultYoutube(
      imgUrl: map['snippet']['thumbnails']['high']['url'] ?? '',
      title: map['snippet']['title'] ?? '',
      linkUrl: 'https://www.youtube.com/watch?v=${map['id']['videoId']}',
      date: map['snippet']['publishedAt'] ?? '',
    );
  }

  String toJson(e) => json.encode(toMap(e));

  static ResultYoutube fromJson(String source) =>
      ResultYoutubeMapper.fromMap(json.decode(source));
}
