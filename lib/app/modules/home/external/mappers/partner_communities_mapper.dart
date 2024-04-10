import 'dart:convert';

import '../../domain/entities/result_partner_communities.dart';

class ResultPartnerCommunitiesMapper {
  Map<String, dynamic> toMap(ResultPartnerCommunities resultPartnerCommunities) {
    return {
      'imageUrl': resultPartnerCommunities.imageUrl,
      'title': resultPartnerCommunities.title,
      'description': resultPartnerCommunities.description,
      'url': resultPartnerCommunities.url,
    };
  }

  static ResultPartnerCommunities fromMap(Map<String, dynamic> map) {
    if (map.isEmpty) {
      return ResultPartnerCommunities(imageUrl: "", title: "", description: "", url: "");
    }

    return ResultPartnerCommunities(
      imageUrl: map['imageUrl'] ??= "",
      title: map['title'] ??= "",
      description: map['description'] ??= "",
      url: map['url'] ??= "",
    );
  }

  String toJson(e) => json.encode(toMap(e));

  static ResultPartnerCommunities fromJson(String source) => ResultPartnerCommunitiesMapper.fromMap(json.decode(source));
}
