import 'dart:convert';

import 'package:flutterando/app/modules/home/domain/entities/result_partners.dart';

class ResultPartnersModel implements ResultPartners {
  final String photoUrl;
  final String siteUrl;

  ResultPartnersModel({required this.photoUrl, required this.siteUrl});

  Map<String, dynamic> toMap() {
    return {
      'photoUrl': photoUrl,
      'siteUrl': siteUrl,
    };
  }

  factory ResultPartnersModel.fromMap(Map<String, dynamic> map) {
    if (map.isEmpty) return ResultPartnersModel(photoUrl: "", siteUrl: "");

    return ResultPartnersModel(
      photoUrl: map['photoUrl'] ??= "",
      siteUrl: map['siteUrl'] ??= "",
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultPartnersModel.fromJson(String source) =>
      ResultPartnersModel.fromMap(json.decode(source));
}
