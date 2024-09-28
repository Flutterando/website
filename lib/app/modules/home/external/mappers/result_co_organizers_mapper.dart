import 'dart:convert';

import 'package:flutterando/app/modules/home/domain/entities/result_co_organizers.dart';

class ResultCoOrganizersMapper {
  Map<String, dynamic> toMap(ResultCoOrganizers resultCoOrganizers) {
    return {
      'name': resultCoOrganizers.name,
      'pathImage': resultCoOrganizers.pathImage,
      'linkedin': resultCoOrganizers.linkedin,
      'status': resultCoOrganizers.status,
    };
  }

  static ResultCoOrganizers fromMap(Map<String, dynamic> map) {
    if (map.isEmpty) {
      return ResultCoOrganizers(
        name: '',
        pathImage: '',
        linkedin: '',
        status: '',
      );
    }

    return ResultCoOrganizers(
      name: map['name'] ??= '',
      pathImage: map['pathImage'] ??= '',
      linkedin: map['linkedin'] ??= '',
      status: map['status'] ??= '',
    );
  }

  String toJson(e) => json.encode(toMap(e));

  static ResultCoOrganizers fromJson(String source) => ResultCoOrganizersMapper.fromMap(json.decode(source));
}
