import 'package:flutter_triple/flutter_triple.dart';
import 'package:flutterando/app/utils/screen/screen_size.dart';

import '../../domain/entities/result_partner_communities.dart';
import '../../domain/usecases/get_partner_communities.dart';

class PartnerCommunitiesController extends Store<List<ResultPartnerCommunities>> {
  final ScreenSize screen;
  final GetPartnerCommunities usecase;
  PartnerCommunitiesController(this.screen, this.usecase) : super([]) {
    fetchPartnerCommunities();
  }

  Future<void> fetchPartnerCommunities() async {
    var response = await usecase();
    response.fold(
      (l) => setError(l),
      (brazilianCases) => update(brazilianCases),
    );
  }
}
