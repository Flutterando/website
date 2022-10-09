import 'dart:convert';

import 'package:flutterando/app/modules/home/domain/entities/result_brazilian_cases.dart';

class ResultBrazilianCasesMapper {
  Map<String, dynamic> toMap(ResultBrazilianCases resultBrazilianCases) {
    return {
      'imageUrl': resultBrazilianCases.imageUrl,
      'title': resultBrazilianCases.title,
      'description': resultBrazilianCases.description,
      'url': resultBrazilianCases.url,
    };
  }

  static ResultBrazilianCases fromMap(Map<String, dynamic> map) {
    if (map.isEmpty) return ResultBrazilianCases(imageUrl: "", title: "", description: "", url: "");

    return ResultBrazilianCases(
      imageUrl: map['imageUrl'] ??= "",
      title: map['title'] ??= "",
      description: map['description'] ??= "",
      url: map['url'] ??= "",
    );
  }

  String toJson(e) => json.encode(toMap(e));

  static ResultBrazilianCases fromJson(String source) => ResultBrazilianCasesMapper.fromMap(json.decode(source));
}
