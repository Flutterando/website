import 'dart:convert';

import 'package:flutterando/app/modules/home/domain/entities/result_founders.dart';

class ResultFoundersMapper {
  static Map<String, dynamic> toMap(ResultFounders resultFounders) {
    return {
      'name': resultFounders.name,
      'pathImage': resultFounders.pathImage,
      'linkedin': resultFounders.linkedin,
    };
  }

  static ResultFounders fromMap(Map<String, dynamic> map) {
    if (map.isEmpty) return ResultFounders("", "", "");

    return ResultFounders(
      map['name'] ??= "",
      map['pathImage'] ??= "",
      map['linkedin'] ??= "",
    );
  }

  String toJson(e) => json.encode(toMap(e));

  static ResultFounders fromJson(String source) => ResultFoundersMapper.fromMap(json.decode(source));
}
