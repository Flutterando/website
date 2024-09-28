import 'package:dartz/dartz.dart';
import 'package:flutterando/app/modules/home/domain/errors/get_insta_followers_error.dart';

import '../entities/result_insta_followers.dart';

abstract class InstaFollowersRepository {
  Future<Either<GetInstaFollowersError, ResultInstaFollowers>> getInstaFollowers();
}
