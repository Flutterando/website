import 'package:dartz/dartz.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_brazilian_cases.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';
import 'package:flutterando/app/modules/home/domain/repositories/brazilian_cases_repository.dart';

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
