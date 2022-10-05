import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando/app/app_widget.dart';
import 'package:flutterando/app/modules/home/home_module.dart';
import 'package:flutterando/app/utils/screen/screen_size.dart';
import 'package:flutterando/app/utils/service/http_service.dart';
import 'package:flutterando/app/utils/url_launcher/url_launcher.dart';

import 'app_controller.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => AppWidget()),
        Bind((_) => AppController()),
        Bind((_) => ScreenSize()),
        Bind((_) => UrlLauncher()),
        Bind<Dio>((i) => Dio()),
        Bind<HttpService>((i) => HttpService(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        // ModuleRoute(Modular.initialRoute, module: HomeModule()),
        ChildRoute("/",
            child: (context, args) => Container(
                  color: Colors.red,
                )),
      ];
}
