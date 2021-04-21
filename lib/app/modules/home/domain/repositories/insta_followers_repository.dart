import 'package:dartz/dartz.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';

import '../entities/result_insta_followers.dart';

abstract class InstaFollowersRepository {
  Future<Either<FailureInstaFollowers, ResultInstaFollowers>>
      getInstaFollowers();
}
