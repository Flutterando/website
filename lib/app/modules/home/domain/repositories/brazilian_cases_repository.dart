import 'package:dartz/dartz.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_brazilian_cases.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_followers_numbers.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';

abstract class BrazilianCasesRepository {
  Future<Either<FailureGetBrazilianCases, List<ResultBrazilianCases>>> get();
  Future<Either<FailureGetBrazilianCases, ResultFollowers>> getFolowers();
}
