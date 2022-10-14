import 'dart:convert';

import '../../domain/entities/result_partners_communities.dart';

class ResultPartnersCommunitiesMapper {
  Map<String, dynamic> toMap(
      ResultPartnersCommunities resultPartnersCommunities) {
    return {
      'photoUrl': resultPartnersCommunities.photoUrl,
      'name': resultPartnersCommunities.name,
      'siteUrl': resultPartnersCommunities.siteUrl,
    };
  }

  static ResultPartnersCommunities fromMap(Map<String, dynamic> map) {
    if (map.isEmpty)
      return ResultPartnersCommunities(photoUrl: "", name: "", siteUrl: "");

    return ResultPartnersCommunities(
      photoUrl: map['photoUrl'] ??= "",
      name: map['name'] ??= "",
      siteUrl: map['siteUrl'] ??= "",
    );
  }

  String toJson(e) => json.encode(toMap(e));

  static ResultPartnersCommunities fromJson(String source) =>
      ResultPartnersCommunitiesMapper.fromMap(json.decode(source));
}
