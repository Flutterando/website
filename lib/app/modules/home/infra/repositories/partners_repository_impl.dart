import 'package:dartz/dartz.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_partners.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';
import 'package:flutterando/app/modules/home/domain/repositories/partners_repository.dart';
import 'package:flutterando/app/modules/home/infra/datasources/partners_datasource.dart';

class PartnersRepositoryImpl implements PartnersRepository {
  final PartnersDatasource datasource;

  PartnersRepositoryImpl(this.datasource);
  @override
  Either<FailureGetPartners, List<ResultPartners>> get() {
    try {
      final result = datasource.getPartners();
      return Right(result);
    } on Exception catch (e) {
      return Left(DatasourceError());
    }
  }
}
