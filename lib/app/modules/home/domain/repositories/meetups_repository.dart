import 'package:dartz/dartz.dart';

import '../entities/result_meetups.dart';
import '../errors/errors.dart';

abstract class MeetupsRepository {
  Either<FailureGetMeetups, List<ResultMeetups>> get();
}
