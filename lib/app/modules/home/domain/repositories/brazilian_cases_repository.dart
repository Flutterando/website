import 'package:dartz/dartz.dart';

import '../entities/result_brazilian_cases.dart';
import '../errors/errors.dart';

abstract class BrazilianCasesRepository {
  Either<FailureGetBrazilianCases, List<ResultBrazilianCases>> get();
}
