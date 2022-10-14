import 'package:dartz/dartz.dart';

import '../entities/result_partners_communities.dart';
import '../errors/errors.dart';

abstract class PartnersCommunitiesRepository {
  Future<Either<FailureGetPartnersCommunities, List<ResultPartnersCommunities>>>
      get();
}
