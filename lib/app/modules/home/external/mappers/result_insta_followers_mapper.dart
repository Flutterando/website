import 'package:flutterando/app/modules/home/domain/entities/result_insta_followers.dart';

class ResultInstaFollowersMapper {
  static ResultInstaFollowers fromMap(Map<String, dynamic> json) {
    return ResultInstaFollowers(
      followersNumber: json["graphql"]['user']['edge_followed_by']['count'] ?? 0,
    );
  }
}
