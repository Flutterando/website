import 'dart:convert';

import 'package:flutterando/app/modules/home/domain/entities/result_co_organizers.dart';

class ResultCoOrganizersModel implements ResultCoOrganizers {
  final String name;
  final String pathImage;
  final String linkedin;
  final String status;

  ResultCoOrganizersModel(
      this.name, this.pathImage, this.linkedin, this.status);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'pathImage': pathImage,
      'linkedin': linkedin,
      'status': status,
    };
  }

  factory ResultCoOrganizersModel.fromMap(Map<String, dynamic> map) {
    if (map.isEmpty) return ResultCoOrganizersModel("", "", "", "");

    return ResultCoOrganizersModel(
      map['name'] ??= "",
      map['pathImage'] ??= "",
      map['linkedin'] ??= "",
      map['status'] ??= "",
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultCoOrganizersModel.fromJson(String source) =>
      ResultCoOrganizersModel.fromMap(json.decode(source));
}
