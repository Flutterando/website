import 'package:dartz/dartz.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_meetups.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';
import 'package:flutterando/app/modules/home/domain/repositories/meetups_repository.dart';

abstract class GetMeetups {
  Future<Either<FailureGetMeetups, List<ResultMeetups>>> call();
}

class GetMeetupsImpl implements GetMeetups {
  final MeetupsRepository repository;
  GetMeetupsImpl(this.repository);

  @override
  Future<Either<FailureGetMeetups, List<ResultMeetups>>> call() async {
    return await repository.get();
  }
}
