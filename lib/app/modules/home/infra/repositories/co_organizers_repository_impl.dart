import 'package:dartz/dartz.dart';

import '../../domain/entities/result_co_organizers.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/co_organizers_repository.dart';
import '../datasources/co_organizers_datasource.dart';

class CoOrganizersRepositoryImpl implements CoOrganizersRepository {
  final CoOrganizersDatasource datasource;
  CoOrganizersRepositoryImpl(this.datasource);
  @override
  Either<FailureGetCoOrganizers, List<ResultCoOrganizers>> get() {
    try {
      final result = datasource.getCoOrganizers();
      return Right(result);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
