import 'package:flutter_triple/flutter_triple.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_meetups.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_meetups.dart';
import 'package:flutterando/app/utils/screen/screen_size.dart';

import '../../domain/errors/errors.dart';

class LatestMeetupsStore extends StreamStore<FailureGetMeetups, List<ResultMeetups>> {
  final ScreenSize screen;
  final GetMeetups usecase;

  LatestMeetupsStore(this.screen, this.usecase) : super([]) {
    fetchMeetups();
  }

  Future<void> fetchMeetups() async {
    var response = await usecase();
    response.fold(
      (l) => setError(l),
      (meetups) => update(meetups),
    );
  }
}
