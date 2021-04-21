import 'package:dartz/dartz.dart';

import '../entities/result_co_organizers.dart';
import '../errors/errors.dart';

abstract class CoOrganizersRepository {
  Either<FailureGetCoOrganizers, List<ResultCoOrganizers>> get();
}
