import 'package:dartz/dartz.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_insta_followers.dart';
import 'package:flutterando/app/modules/home/domain/repositories/insta_followers_repository.dart';
import 'package:flutterando/app/modules/home/infra/datasources/insta_followers_datasource.dart';

import '../../domain/errors/errors.dart';

class InstaFollowersRepositoryImpl implements InstaFollowersRepository {
  final InstaFollowersDatasource datasource;
  InstaFollowersRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureInstaFollowers, ResultInstaFollowers>>
      getInstaFollowers() async {
    try {
      final result = await datasource.getInstaFollowers();
      return Right(result);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
