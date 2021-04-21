import 'package:dartz/dartz.dart';

import '../entities/result_package.dart';
import '../errors/errors.dart';
import '../repositories/packages_repository.dart';

abstract class GetPackages {
  Either<FailureGetPackages, List<ResultPackage>> call();
}

class GetPackagesImpl implements GetPackages {
  final PackagesRepository repository;
  GetPackagesImpl(this.repository);
  @override
  Either<FailureGetPackages, List<ResultPackage>> call() {
    return repository.get();
  }
}
