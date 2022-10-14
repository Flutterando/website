import 'package:dartz/dartz.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';

import '../../domain/entities/result_partners_communities.dart';
import '../../domain/repositories/partners_communities_repository.dart';
import '../datasources/partners_communities_datasource.dart';

class PartnersCommunitiesRepositoryImpl
    implements PartnersCommunitiesRepository {
  final PartnersCommunitiesDatasource datasource;

  PartnersCommunitiesRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureGetPartnersCommunities, List<ResultPartnersCommunities>>>
      get() async {
    try {
      final result = await datasource.getPartnersCommunities();
      return Right(result);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
