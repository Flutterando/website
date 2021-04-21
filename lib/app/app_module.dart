import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'modules/home/home_module.dart';
import 'modules/home/widgets/co_organizers/co_organizers_controller.dart';
import 'utils/screen/screen_size.dart';
import 'utils/url_launcher/url_launcher.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        $AppController,
        $CoOrganizersController,
        $ScreenSize,
        $UrlLauncher,
        Bind<Dio>((i) => Dio()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: HomeModule()),
      ];
}
