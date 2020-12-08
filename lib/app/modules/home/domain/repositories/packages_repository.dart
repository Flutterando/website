import 'package:dartz/dartz.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_package.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';

abstract class PackagesRepository {
  Either<FailureGetPackages, List<ResultPackage>> get();
}
