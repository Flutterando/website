import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_youtube.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_youtube.dart';
import 'package:flutterando/app/utils/screen/screen_size.dart';
import 'package:flutterando/app/utils/url_launcher/url_launcher.dart';
import 'package:mobx/mobx.dart';

part 'latest_channel_videos_controller.g.dart';

@Injectable()
class LatestChannelVideosController = _LatestChannelVideosControllerBase
    with _$LatestChannelVideosController;

abstract class _LatestChannelVideosControllerBase with Store {
  final GetYoutube getYoutube;
  final ScreenSize screen;
  final UrlLauncher urlLauncher;
  _LatestChannelVideosControllerBase(this.getYoutube, this.screen, this.urlLauncher) {
    fetchYoutube();
  }

  @observable
  ObservableList<ResultYoutube> youtube = <ResultYoutube>[].asObservable();

  @observable
  String error = "";

  @action
  fetchYoutube() async {
    var response = await getYoutube.call();
    response.fold(
      (l) => error = l.toString(), 
      (r) => youtube = r.asObservable());
  }
}
