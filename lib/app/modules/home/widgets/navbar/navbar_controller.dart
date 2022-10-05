import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando/app/utils/screen/screen_size.dart';
import 'package:mobx/mobx.dart';

part 'navbar_controller.g.dart';

@Injectable()
class NavbarController = _NavbarControllerBase with _$NavbarController;

abstract class _NavbarControllerBase with Store {
  ScreenSize screen;

  _NavbarControllerBase(this.screen);
}
