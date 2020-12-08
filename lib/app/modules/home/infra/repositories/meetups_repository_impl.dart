import 'package:dartz/dartz.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_meetups.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';
import 'package:flutterando/app/modules/home/domain/repositories/meetups_repository.dart';
import 'package:flutterando/app/modules/home/infra/datasources/meetups_datasource.dart';

class MeetupsRepositoryImpl implements MeetupsRepository {
  final MeetupsDatasource datasource;
  MeetupsRepositoryImpl(this.datasource);
  @override
  Either<FailureGetMeetups, List<ResultMeetups>> get() {
    try {
      final result = datasource.getMeetups();
      return Right(result);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
