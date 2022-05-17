import 'package:dartz/dartz.dart';

import '../entities/result_founders.dart';
import '../errors/errors.dart';

abstract class FoundersRepository {
  Future<Either<FailureGetFounders, List<ResultFounders>>> get();
}
