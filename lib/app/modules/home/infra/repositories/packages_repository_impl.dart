import 'package:dartz/dartz.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_package.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';
import 'package:flutterando/app/modules/home/domain/repositories/packages_repository.dart';
import 'package:flutterando/app/modules/home/infra/datasources/packages_datasource.dart';

class PackagesRepositoryImpl implements PackagesRepository {
  PackagesDatasource datasource;
  PackagesRepositoryImpl(this.datasource);

  @override
  Future<Either<FailureGetPackages, List<ResultPackage>>> get() async {
    try {
      final result = await datasource.getPackages();
      return Right(result);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
