import 'package:flutter_triple/flutter_triple.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_youtube.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_youtube.dart';
import 'package:flutterando/app/utils/screen/screen_size.dart';
import 'package:mobx/mobx.dart';

import '../../domain/errors/errors.dart';

class LatestChannelVideosStore extends StreamStore<FailureGetYoutube, List<ResultYoutube>> {
  final GetYoutube getYoutube;
  final ScreenSize screen;
  LatestChannelVideosStore(this.getYoutube, this.screen) : super([]) {
    fetchYoutube();
  }

  @action
  fetchYoutube() async {
    var response = await getYoutube.call();
    response.fold(
      (l) => setError(l),
      (youtube) => update(youtube),
    );
  }
}
