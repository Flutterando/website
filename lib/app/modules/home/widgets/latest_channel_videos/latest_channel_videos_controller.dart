import 'package:flutterando/app/utils/screen/screen_size.dart';
import 'package:flutterando/app/utils/url_launcher/url_launcher.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'latest_channel_videos_controller.g.dart';

@Injectable()
class LatestChannelVideosController = _LatestChannelVideosControllerBase
    with _$LatestChannelVideosController;

abstract class _LatestChannelVideosControllerBase with Store {
  final ScreenSize screen;
  final UrlLauncher urlLauncher;
  _LatestChannelVideosControllerBase(this.screen, this.urlLauncher);
}
