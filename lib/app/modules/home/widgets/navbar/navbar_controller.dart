import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../utils/screen/screen_size.dart';
import '../../../../utils/url_launcher/url_launcher.dart';

part 'navbar_controller.g.dart';

@Injectable()
class NavbarController = _NavbarControllerBase with _$NavbarController;

abstract class _NavbarControllerBase with Store {
  ScreenSize screen;
  UrlLauncher urlLauncher;
  _NavbarControllerBase(this.screen, this.urlLauncher);
}
