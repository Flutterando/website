import 'package:flutter_triple/flutter_triple.dart';

import '../../../../utils/screen/screen_size.dart';
import '../../domain/entities/result_partners_communities.dart';
import '../../domain/errors/errors.dart';
import '../../domain/usecases/get_partners_communities.dart';

class PartnersCommunitiesStore
    extends StreamStore<FailureGetPartnersCommunities, List<ResultPartnersCommunities>> {
  final ScreenSize screen;
  final GetPartnersCommunities usecase;
  PartnersCommunitiesStore(this.screen, this.usecase) : super([]) {
    fetchPartnersCommunities();
  }

  fetchPartnersCommunities() async {
    var response = await usecase.call();
    response.fold(
      (l) => setError(l),
      (r) => update(r),
    );
  }
}
