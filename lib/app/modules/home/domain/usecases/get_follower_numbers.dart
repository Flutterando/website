import 'package:dartz/dartz.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_followers_numbers.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';
import 'package:flutterando/app/modules/home/domain/repositories/brazilian_cases_repository.dart';

abstract class GetFollowersNumbers {
  Future<Either<FailureGetBrazilianCases, ResultFollowers>> call();
}

class GetFolowersNumbersImpl implements GetFollowersNumbers {
  final BrazilianCasesRepository repository;

  GetFolowersNumbersImpl(this.repository);

  @override
  Future<Either<FailureGetBrazilianCases, ResultFollowers>> call() async {
    return await repository.getFolowers();
  }
}
