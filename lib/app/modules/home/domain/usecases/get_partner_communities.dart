import 'package:dartz/dartz.dart';
import 'package:flutterando/app/modules/home/domain/errors/errors.dart';
import '../entities/result_partner_communities.dart';
import '../repositories/partner_communities_repository.dart';

abstract class GetPartnerCommunities {
  Future<Either<FailureGetPartnerCommunities, List<ResultPartnerCommunities>>>
      call();
}

class GetPartnerCommunitiesImpl implements GetPartnerCommunities {
  final PartnerCommunitiesRepository repository;
  
  GetPartnerCommunitiesImpl(this.repository);

  @override
  Future<Either<FailureGetPartnerCommunities, List<ResultPartnerCommunities>>>
      call() async {
    return await repository.get();
  }
}
