import 'package:dartz/dartz.dart';

import '../../domain/entities/result_package.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/packages_repository.dart';
import '../datasources/packages_datasource.dart';

class PackagesRepositoryImpl implements PackagesRepository {
  PackagesDatasource datasource;
  PackagesRepositoryImpl(this.datasource);
  @override
  Either<FailureGetPackages, List<ResultPackage>> get() {
    try {
      final result = datasource.getPackages();
      return Right(result);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
