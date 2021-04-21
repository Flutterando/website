import 'package:dartz/dartz.dart';

import '../../domain/entities/result_partners.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/partners_repository.dart';
import '../datasources/partners_datasource.dart';

class PartnersRepositoryImpl implements PartnersRepository {
  final PartnersDatasource datasource;

  PartnersRepositoryImpl(this.datasource);
  @override
  Either<FailureGetPartners, List<ResultPartners>> get() {
    try {
      final result = datasource.getPartners();
      return Right(result);
    } on DatasourceError catch (e) {
      return Left(e);
    }
  }
}
