import 'package:flutterando/app/modules/home/domain/entities/result_insta_followers.dart';

class ResultInstaFollowersModel extends ResultInstaFollowers {
  ResultInstaFollowersModel({
    required int userFollowerNumber,
  }) : super(followersNumber: userFollowerNumber);

  factory ResultInstaFollowersModel.fromMap(Map<String, dynamic> json) {
    return ResultInstaFollowersModel(
      userFollowerNumber:
          json["graphql"]['user']['edge_followed_by']['count'] ?? 0,
    );
  }
}
