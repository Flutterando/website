import 'dart:convert';

import '../../domain/entities/result_package.dart';

class ResultPackagesModel implements ResultPackage {
  final String name;
  final String author;
  final String version;
  final String description;
  final String url;

  ResultPackagesModel(
      this.name, this.author, this.version, this.description, this.url);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'author': author,
      'version': version,
      'description': description,
      'url': url,
    };
  }

  factory ResultPackagesModel.fromMap(Map<String, dynamic> map) {
    if (map.isEmpty) return ResultPackagesModel("", "", "", "", "");

    return ResultPackagesModel(
      map['name'],
      map['author'],
      map['version'],
      map['description'],
      map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultPackagesModel.fromJson(String source) =>
      ResultPackagesModel.fromMap(json.decode(source));
}
