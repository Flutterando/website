import '../../domain/entities/result_partners_communities.dart';

abstract class PartnersCommunitiesDatasource {
  Future<List<ResultPartnersCommunities>> getPartnersCommunities();
}
