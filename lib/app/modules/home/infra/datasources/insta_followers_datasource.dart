import 'package:flutterando/app/modules/home/domain/entities/result_insta_followers.dart';

abstract class InstaFollowersDatasource {
  Future<ResultInstaFollowers> getInstaFollowers();
}
