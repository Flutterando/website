import 'package:dartz/dartz.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_brazilian_cases.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_followers_numbers.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';
import 'package:flutterando/app/modules/home/domain/repositories/brazilian_cases_repository.dart';
import 'package:flutterando/app/modules/home/infra/datasources/brazilian_cases_datasource.dart';

class BrazilianCasesRepositoryImpl implements BrazilianCasesRepository {
  final BrazilianCasesDatasource datasource;
  BrazilianCasesRepositoryImpl(this.datasource);
  
  @override
  Future<Either<FailureGetBrazilianCases, List<ResultBrazilianCases>>> get() async {
    try {
      final result = await datasource.getBrazilianCases();
      return Right(result);
    } catch (e) {
      return Left(DatasourceError());
    }
  }

  @override
  Future<Either<FailureGetBrazilianCases, ResultFollowers>> getFolowers() async {
    try {
      final result = await datasource.getFolowers();
      return Right(result);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
