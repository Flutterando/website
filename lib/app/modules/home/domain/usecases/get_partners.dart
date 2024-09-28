import 'package:dartz/dartz.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_partners.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';
import 'package:flutterando/app/modules/home/domain/repositories/partners_repository.dart';

abstract class GetPartners {
  Future<Either<FailureGetPartners, List<ResultPartners>>> call();
}

class GetPartnersImpl implements GetPartners {
  final PartnersRepository repository;
  
  GetPartnersImpl(this.repository);

  @override
  Future<Either<FailureGetPartners, List<ResultPartners>>> call() async {
    return await repository.get();
  }
}
