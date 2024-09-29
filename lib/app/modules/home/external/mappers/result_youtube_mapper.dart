import 'dart:convert';

import 'package:flutterando/app/modules/home/domain/entities/result_youtube.dart';

class ResultYoutubeMapper {
  Map<String, dynamic> toMap(ResultYoutube resultYoutube) {
    return {
      'thumbnail': resultYoutube.imgUrl,
      'title': resultYoutube.title,
      'linkUrl': resultYoutube.linkUrl,
      'date': resultYoutube.date.toIso8601String(),
    };
  }

  static ResultYoutube fromMap(Map<String, dynamic> map) {
    return ResultYoutube(
      imgUrl: map['thumbnail'],
      title: map['title'],
      linkUrl: map['linkUrl'],
      date: DateTime.parse(map['date']),
    );
  }

  String toJson(e) => json.encode(toMap(e));

  static ResultYoutube fromJson(String source) => ResultYoutubeMapper.fromMap(json.decode(source));
}
