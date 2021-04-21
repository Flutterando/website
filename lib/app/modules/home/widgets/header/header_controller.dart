import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../utils/screen/screen_size.dart';
import '../../../../utils/url_launcher/url_launcher.dart';

part 'header_controller.g.dart';

@Injectable()
class HeaderController = _HeaderControllerBase with _$HeaderController;

abstract class _HeaderControllerBase with Store {
  final ScreenSize screen;
  final UrlLauncher urlLauncher;
  _HeaderControllerBase(this.screen, this.urlLauncher) {
    instaFollowers();
  }

  @observable
  String? followers = "";

  @action
  Future<void> instaFollowers() async {}
}
