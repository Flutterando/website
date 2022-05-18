import 'dart:convert';

import 'package:flutterando/app/modules/home/domain/entities/result_founders.dart';

class ResultFoundersModel implements ResultFounders {
  final String name;
  final String pathImage;
  final String linkedin;

  ResultFoundersModel(this.name, this.pathImage, this.linkedin);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'pathImage': pathImage,
      'linkedin': linkedin,
    };
  }

  factory ResultFoundersModel.fromMap(Map<String, dynamic> map) {
    if (map.isEmpty) return ResultFoundersModel("", "", "");

    return ResultFoundersModel(
      map['name'] ??= "",
      map['pathImage'] ??= "",
      map['linkedin'] ??= "",
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultFoundersModel.fromJson(String source) => ResultFoundersModel.fromMap(json.decode(source));
}
