import 'package:dartz/dartz.dart';

import '../../domain/entities/result_meetups.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/meetups_repository.dart';
import '../datasources/meetups_datasource.dart';

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
