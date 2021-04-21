import 'package:dartz/dartz.dart';

import '../entities/result_co_organizers.dart';
import '../errors/errors.dart';
import '../repositories/co_organizers_repository.dart';

abstract class GetCoOrganizers {
  Either<FailureGetCoOrganizers, List<ResultCoOrganizers>> call();
}

class GetCoOrganizersImpl extends GetCoOrganizers {
  final CoOrganizersRepository repository;
  GetCoOrganizersImpl(this.repository);
  @override
  Either<FailureGetCoOrganizers, List<ResultCoOrganizers>> call() {
    return repository.get();
  }
}
