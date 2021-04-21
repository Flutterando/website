import 'package:dartz/dartz.dart';

import '../entities/result_partners.dart';
import '../errors/errors.dart';

abstract class PartnersRepository {
  Either<FailureGetPartners, List<ResultPartners>> get();
}
