import 'package:dartz/dartz.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_co_organizers.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';
import 'package:flutterando/app/modules/home/domain/repositories/co_organizers_repository.dart';
import 'package:flutterando/app/modules/home/infra/datasources/co_organizers_datasource.dart';

class CoOrganizersRepositoryImpl implements CoOrganizersRepository {
  final CoOrganizersDatasource datasource;
  CoOrganizersRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureGetCoOrganizers, List<ResultCoOrganizers>>> get() async {
    try {
      final result = await datasource.getCoOrganizers();
      return Right(result);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
