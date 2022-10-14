import 'package:dartz/dartz.dart';
import '../entities/result_partners_communities.dart';
import '../errors/errors.dart';
import '../repositories/partners_communities_repository.dart';

abstract class GetPartnersCommunities {
  Future<Either<FailureGetPartnersCommunities, List<ResultPartnersCommunities>>>
      call();
}

class GetPartnersCommunitiesImpl implements GetPartnersCommunities {
  final PartnersCommunitiesRepository repository;
  GetPartnersCommunitiesImpl(this.repository);
  @override
  Future<Either<FailureGetPartnersCommunities, List<ResultPartnersCommunities>>>
      call() async {
    return await repository.get();
  }
}
