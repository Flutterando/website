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
    if (map.isEmpty) {
      return ResultFounders(
        name: '',
        pathImage: '',
        linkedin: '',
      );
    }

    return ResultFounders(
      name: map['name'] ??= '',
      pathImage: map['pathImage'] ??= '',
      linkedin: map['linkedin'] ??= '',
    );
  }

  String toJson(e) => json.encode(toMap(e));

  static ResultFounders fromJson(String source) => ResultFoundersMapper.fromMap(json.decode(source));
}
