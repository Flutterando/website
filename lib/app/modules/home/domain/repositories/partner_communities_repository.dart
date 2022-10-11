import 'package:dartz/dartz.dart';

import '../entities/result_folowers_numbers.dart';
import '../entities/result_partner_communities.dart';
import '../errors/errors.dart';

abstract class PartnerCommunitiesRepository {
  Future<Either<FailureGetPartnerCommunities, List<ResultPartnerCommunities>>>
      get();
  Future<Either<FailureGetPartnerCommunities, ResultFolowers>> getFolowers();
}
