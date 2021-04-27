import 'package:dartz/dartz.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_insta_followers.dart';
import 'package:flutterando/app/modules/home/domain/errors/get_insta_followers_error.dart';
import 'package:flutterando/app/modules/home/domain/repositories/insta_followers_repository.dart';
import 'package:flutterando/app/modules/home/infra/datasources/insta_followers_datasource.dart';

class InstaFollowersRepositoryImpl implements InstaFollowersRepository {
  final InstaFollowersDatasource datasource;
  InstaFollowersRepositoryImpl(this.datasource);
  @override
  Future<Either<GetInstaFollowersError, ResultInstaFollowers>>
      getInstaFollowers() async {
    try {
      final result = await datasource.getInstaFollowers();
      return Right(result);
    } on GetInstaFollowersError catch (error) {
      return Left(error);
    } catch (error, stacktrace) {
      return Left(
        GetInstaFollowersError(
          message: "erro no datasource: ${error.toString()}$stacktrace",
        ),
      );
    }
  }
}
