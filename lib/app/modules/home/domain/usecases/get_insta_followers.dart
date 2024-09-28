import 'package:dartz/dartz.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_insta_followers.dart';
import 'package:flutterando/app/modules/home/domain/errors/get_insta_followers_error.dart';
import 'package:flutterando/app/modules/home/domain/repositories/insta_followers_repository.dart';

abstract class GetInstaFollowers {
  Future<Either<GetInstaFollowersError, ResultInstaFollowers>> call();
}

class GetInstaFollowersImpl implements GetInstaFollowers {
  final InstaFollowersRepository repository;

  GetInstaFollowersImpl(this.repository);
  
  @override
  Future<Either<GetInstaFollowersError, ResultInstaFollowers>> call() async {
    final result = await repository.getInstaFollowers();
    return result;
  }
}
