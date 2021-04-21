import 'package:dartz/dartz.dart';

import '../../domain/entities/result_brazilian_cases.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/brazilian_cases_repository.dart';
import '../datasources/brazilian_cases_datasource.dart';

class BrazilianCasesRepositoryImpl implements BrazilianCasesRepository {
  final BrazilianCasesDatasource datasource;
  BrazilianCasesRepositoryImpl(this.datasource);
  @override
  Either<FailureGetBrazilianCases, List<ResultBrazilianCases>> get() {
    try {
      final result = datasource.getBrazilianCases();
      return Right(result);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
