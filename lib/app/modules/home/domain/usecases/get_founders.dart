import 'package:dartz/dartz.dart';

import '../entities/result_founders.dart';
import '../errors/errors.dart';
import '../repositories/founders_repository.dart';

abstract class GetFounders {
  Future<Either<FailureGetFounders, List<ResultFounders>>> call();
}

class GetFoundersImpl extends GetFounders {
  final FoundersRepository repository;

  GetFoundersImpl(this.repository);

  @override
  Future<Either<FailureGetFounders, List<ResultFounders>>> call() async {
    return await repository.get();
  }
}
