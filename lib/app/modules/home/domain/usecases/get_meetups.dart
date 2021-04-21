import 'package:dartz/dartz.dart';

import '../entities/result_meetups.dart';
import '../errors/errors.dart';
import '../repositories/meetups_repository.dart';

abstract class GetMeetups {
  Either<FailureGetMeetups, List<ResultMeetups>> call();
}

class GetMeetupsImpl implements GetMeetups {
  final MeetupsRepository repository;
  GetMeetupsImpl(this.repository);
  @override
  Either<FailureGetMeetups, List<ResultMeetups>> call() {
    return repository.get();
  }
}
