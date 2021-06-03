import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando/app/modules/home/home_module.dart';
import 'package:flutterando/app/utils/screen/screen_size.dart';
import 'package:flutterando/app/utils/service/http_service.dart';
import 'package:flutterando/app/utils/url_launcher/url_launcher.dart';

import 'app_controller.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => ScreenSize()),
        Bind((i) => UrlLauncher()),
        Bind<Dio>((i) => Dio()),
        Bind<HttpService>((i) => HttpService(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: HomeModule()),
      ];
}
