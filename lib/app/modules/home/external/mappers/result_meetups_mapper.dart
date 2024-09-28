import 'dart:convert';

import 'package:flutterando/app/modules/home/domain/entities/result_meetups.dart';

class ResultMeetupsMapper {
  Map<String, dynamic> toMap(ResultMeetups resultMeetups) {
    return {
      'photoUrl': resultMeetups.photoUrl,
      'title': resultMeetups.title,
      'linkUrl': resultMeetups.linkUrl,
      'date': resultMeetups.date,
    };
  }

  static ResultMeetups fromMap(Map<String, dynamic> map) {
    if (map.isEmpty) {
      return ResultMeetups(
        photoUrl: '',
        title: '',
        linkUrl: '',
        date: '',
      );
    }

    return ResultMeetups(
      photoUrl: map['photoUrl'] ??= '',
      title: map['title'] ??= '',
      linkUrl: map['linkUrl'] ??= '',
      date: map['date'] ??= '',
    );
  }

  String toJson(e) => json.encode(toMap(e));

  static ResultMeetups fromJson(String source) => ResultMeetupsMapper.fromMap(json.decode(source));
}
