import 'dart:convert';

import 'package:flutterando/app/modules/home/domain/entities/result_youtube.dart';

class ResultYoutubeModel extends ResultYoutube {
  final String imgUrl;
  final String title;
  final String linkUrl;
  final String date;

  ResultYoutubeModel({required this.imgUrl, required this.title, required this.linkUrl, required this.date}) : super(imgUrl: '', linkUrl: '', title: '', date: '');

  Map<String, dynamic> toMap() {
    return {
      'imgUrl': imgUrl,
      'title': title,
      'linkUrl': linkUrl,
      'date': date,
    };
  }

  factory ResultYoutubeModel.fromMap(Map<String, dynamic> map) {
    return ResultYoutubeModel(
      imgUrl: map['imgUrl'],
      title: map['title'],
      linkUrl: map['linkUrl'],
      date: map['date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultYoutubeModel.fromJson(String source) => ResultYoutubeModel.fromMap(json.decode(source));
}
