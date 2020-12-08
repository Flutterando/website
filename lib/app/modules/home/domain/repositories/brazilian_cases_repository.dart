import 'package:dartz/dartz.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_brazilian_cases.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';

abstract class BrazilianCasesRepository {
  Either<FailureGetBrazilianCases, List<ResultBrazilianCases>> get();
}
