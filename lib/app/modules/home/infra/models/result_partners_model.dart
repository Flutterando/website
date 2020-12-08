import 'dart:convert';

import 'package:flutterando/app/modules/home/domain/entities/result_partners.dart';

class ResultPartnersModel extends ResultPartners {
  final String photoUrl;

  ResultPartnersModel(this.photoUrl);

  Map<String, dynamic> toMap() {
    return {
      'photoUrl': photoUrl,
    };
  }

  factory ResultPartnersModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ResultPartnersModel(
      map['photoUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultPartnersModel.fromJson(String source) =>
      ResultPartnersModel.fromMap(json.decode(source));
}
