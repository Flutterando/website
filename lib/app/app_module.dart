import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando/app/app_widget.dart';
import 'package:flutterando/app/utils/screen/screen_size.dart';
import 'package:flutterando/app/utils/service/http_service.dart';

import 'app_controller.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => AppWidget()),
        Bind((_) => AppController()),
        Bind((_) => ScreenSize()),
        Bind<Dio>((i) => Dio()),
        Bind<HttpService>((i) => HttpService(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: HomeModule()),
      ];
}
