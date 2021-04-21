import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../utils/screen/screen_size.dart';
import '../../../../utils/url_launcher/url_launcher.dart';

part 'latest_channel_videos_controller.g.dart';

@Injectable()
class LatestChannelVideosController = _LatestChannelVideosControllerBase
    with _$LatestChannelVideosController;

abstract class _LatestChannelVideosControllerBase with Store {
  final ScreenSize screen;
  final UrlLauncher urlLauncher;
  _LatestChannelVideosControllerBase(this.screen, this.urlLauncher);
}
