import 'package:flutterando/app/modules/home/domain/entities/result_followers_numbers.dart';

import '../../domain/entities/result_partner_communities.dart';

abstract class PartnerCommunitiesDatasource {
  Future<List<ResultPartnerCommunities>> getPartnerCommunities();
  Future<ResultFollowers> getFolowers();
}
