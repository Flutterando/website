import 'package:dartz/dartz.dart';

import '../entities/result_package.dart';
import '../errors/errors.dart';

abstract class PackagesRepository {
  Either<FailureGetPackages, List<ResultPackage>> get();
}
