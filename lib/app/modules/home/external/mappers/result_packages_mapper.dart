import 'dart:convert';

import 'package:flutterando/app/modules/home/domain/entities/result_package.dart';

class ResultPackagesMapper {
  static ResultPackage fromMap(Map<String, dynamic> map) {
    if (map.isEmpty) return ResultPackage("", "", "", "", "", "");

    return ResultPackage(
      map['name'],
      map['author'],
      map['version'],
      map['description'],
      map['url'],
      map['imageUrl'],
    );
  }

  static ResultPackage fromJson(String source) => ResultPackagesMapper.fromMap(json.decode(source));
}
