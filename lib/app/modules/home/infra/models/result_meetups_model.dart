import 'dart:convert';

import '../../domain/entities/result_meetups.dart';

class ResultMeetupsModel implements ResultMeetups {
  final String photoUrl;
  final String title;
  final String linkUrl;
  final String date;

  ResultMeetupsModel(this.photoUrl, this.title, this.linkUrl, this.date);

  Map<String, dynamic> toMap() {
    return {
      'photoUrl': photoUrl,
      'title': title,
      'linkUrl': linkUrl,
      'date': date,
    };
  }

  factory ResultMeetupsModel.fromMap(Map<String, dynamic> map) {
    if (map.isEmpty) return ResultMeetupsModel("", "", "", "");

    return ResultMeetupsModel(
      map['photoUrl'] ??= "",
      map['title'] ??= "",
      map['linkUrl'] ??= "",
      map['date'] ??= "",
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultMeetupsModel.fromJson(String source) =>
      ResultMeetupsModel.fromMap(json.decode(source));
}
