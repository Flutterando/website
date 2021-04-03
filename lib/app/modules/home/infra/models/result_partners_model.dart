import 'dart:convert';

import 'package:flutterando/app/modules/home/domain/entities/result_partners.dart';

class ResultPartnersModel implements ResultPartners {
  final String photoUrl;

  ResultPartnersModel({required this.photoUrl});

  Map<String, dynamic> toMap() {
    return {
      'photoUrl': photoUrl,
    };
  }

  factory ResultPartnersModel.fromMap(Map<String, dynamic> map) {
    if (map.isEmpty) return ResultPartnersModel(photoUrl: "");

    return ResultPartnersModel(
      photoUrl: map['photoUrl'] ??= "",
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultPartnersModel.fromJson(String source) =>
      ResultPartnersModel.fromMap(json.decode(source));
}
