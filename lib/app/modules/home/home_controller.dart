import 'package:flutterando/app/utils/screen/screen_size.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final ScreenSize screen;
  _HomeControllerBase(this.screen);
}
