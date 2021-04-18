import 'package:dartz/dartz.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_partners.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';
import 'package:flutterando/app/modules/home/domain/repositories/partners_repository.dart';
import 'package:flutterando/app/modules/home/infra/datasources/partners_datasource.dart';

class PartnersRepositoryImpl implements PartnersRepository {
  final PartnersDatasource datasource;

  PartnersRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureGetPartners, List<ResultPartners>>> get() async {
    try {
      final result = await datasource.getPartners();
      return Right(result);
    } on DatasourceError catch (e) {
      return Left(e);
    }
  }
}
