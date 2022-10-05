import 'dart:convert';

import 'package:flutterando/app/modules/home/domain/entities/result_package.dart';

class ResultPackagesModel implements ResultPackage {
  final String name;
  final String author;
  final String version;
  final String description;
  final String url;
  final String imageUrl;

  ResultPackagesModel(this.name, this.author, this.version, this.description, this.url, this.imageUrl);

  factory ResultPackagesModel.fromMap(Map<String, dynamic> map) {
    if (map.isEmpty) return ResultPackagesModel("", "", "", "", "", "");

    return ResultPackagesModel(
      map['name'],
      map['author'],
      map['version'],
      map['description'],
      map['url'],
      map['imageUrl'],
    );
  }

  factory ResultPackagesModel.fromJson(String source) => ResultPackagesModel.fromMap(json.decode(source));
}
