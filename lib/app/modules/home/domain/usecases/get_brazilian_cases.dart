import 'package:dartz/dartz.dart';

import '../entities/result_brazilian_cases.dart';
import '../errors/errors.dart';
import '../repositories/brazilian_cases_repository.dart';

abstract class GetBrazilianCases {
  Either<FailureGetBrazilianCases, List<ResultBrazilianCases>> call();
}

class GetBrazilianCasesImpl implements GetBrazilianCases {
  final BrazilianCasesRepository repository;
  GetBrazilianCasesImpl(this.repository);

  @override
  Either<FailureGetBrazilianCases, List<ResultBrazilianCases>> call() {
    return repository.get();
  }
}
