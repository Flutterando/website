import 'package:dartz/dartz.dart';

import '../entities/result_partners.dart';
import '../errors/errors.dart';
import '../repositories/partners_repository.dart';

abstract class GetPartners {
  Either<FailureGetPartners, List<ResultPartners>> call();
}

class GetPartnersImpl implements GetPartners {
  final PartnersRepository repository;
  GetPartnersImpl(this.repository);
  @override
  Either<FailureGetPartners, List<ResultPartners>> call() {
    return repository.get();
  }
}
