import 'package:dartz/dartz.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_folowers_numbers.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';
import '../../domain/entities/result_partner_communities.dart';
import '../../domain/repositories/partner_communities_repository.dart';
import '../datasources/partner_communities_datasource.dart';

class PartnerCommunitiesRepositoryImpl implements PartnerCommunitiesRepository {
  final PartnerCommunitiesDatasource datasource;
  PartnerCommunitiesRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureGetPartnerCommunities, List<ResultPartnerCommunities>>>
      get() async {
    try {
      final result = await datasource.getPartnerCommunities();
      return Right(result);
    } catch (e) {
      return Left(DatasourceError());
    }
  }

  @override
  Future<Either<FailureGetPartnerCommunities, ResultFolowers>>
      getFolowers() async {
    try {
      final result = await datasource.getFolowers();
      return Right(result);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
