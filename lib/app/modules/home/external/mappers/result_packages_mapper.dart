import 'dart:convert';

import 'package:flutterando/app/modules/home/domain/entities/result_package.dart';

class ResultPackagesMapper {
  static ResultPackage fromMap(Map<String, dynamic> map) {
    if (map.isEmpty) {
      return ResultPackage(
        name: '',
        author: '',
        version: '',
        description: '',
        url: '',
        imageUrl: '',
      );
    }

    return ResultPackage(
      name: map['name'] ??= '',
      author: map['author'] ??= '',
      version: map['version'] ??= '',
      description: map['description'] ??= '',
      url: map['url'] ??= '',
      imageUrl: map['imageUrl'] ??= '',
    );
  }

  static ResultPackage fromJson(String source) => ResultPackagesMapper.fromMap(json.decode(source));
}
