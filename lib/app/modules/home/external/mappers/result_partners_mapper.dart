import 'dart:convert';

import 'package:flutterando/app/modules/home/domain/entities/result_partners.dart';

class ResultPartnersMapper {
  Map<String, dynamic> toMap(ResultPartners resultPartners) {
    return {
      'photoUrl': resultPartners.photoUrl,
      'siteUrl': resultPartners.siteUrl,
    };
  }

  static ResultPartners fromMap(Map<String, dynamic> map) {
    if (map.isEmpty) return ResultPartners(photoUrl: "", siteUrl: "");

    return ResultPartners(
      photoUrl: map['photoUrl'] ??= "",
      siteUrl: map['siteUrl'] ??= "",
    );
  }

  String toJson(e) => json.encode(toMap(e));

  static ResultPartners fromJson(String source) => ResultPartnersMapper.fromMap(json.decode(source));
}
