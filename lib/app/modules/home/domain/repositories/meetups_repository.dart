import 'package:dartz/dartz.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_meetups.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';

abstract class MeetupsRepository {
  Future<Either<FailureGetMeetups, List<ResultMeetups>>> get();
}
