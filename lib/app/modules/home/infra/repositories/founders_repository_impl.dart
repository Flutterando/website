import 'package:dartz/dartz.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_founders.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';
import 'package:flutterando/app/modules/home/domain/repositories/founders_repository.dart';

import '../datasources/founders_datasource.dart';

class FoundersRepositoryImpl implements FoundersRepository {
  final FoundersDatasource datasource;
  FoundersRepositoryImpl(this.datasource);
  
  @override
  Future<Either<FailureGetFounders, List<ResultFounders>>> get() async {
    try {
      final result = await datasource.getFounders();
      return Right(result);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
