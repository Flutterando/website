import 'package:dartz/dartz.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_package.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';
import 'package:flutterando/app/modules/home/domain/repositories/packages_repository.dart';

abstract class GetPackages {
  Future<Either<FailureGetPackages, List<ResultPackage>>> call();
}

class GetPackagesImpl implements GetPackages {
  final PackagesRepository repository;
  
  GetPackagesImpl(this.repository);

  @override
  Future<Either<FailureGetPackages, List<ResultPackage>>> call() async {
    return await repository.get();
  }
}
