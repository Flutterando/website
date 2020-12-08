import 'dart:convert';

import 'package:flutterando/app/modules/home/domain/entities/result_brazilian_cases.dart';

class ResultBrazilianCasesModel implements ResultBrazilianCases {
  final String imageUrl;
  final String title;
  final String description;
  final String url;
  ResultBrazilianCasesModel({
    this.imageUrl,
    this.title,
    this.description,
    this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'title': title,
      'description': description,
      'url': url,
    };
  }

  factory ResultBrazilianCasesModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ResultBrazilianCasesModel(
      imageUrl: map['imageUrl'],
      title: map['title'],
      description: map['description'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultBrazilianCasesModel.fromJson(String source) =>
      ResultBrazilianCasesModel.fromMap(json.decode(source));
}
