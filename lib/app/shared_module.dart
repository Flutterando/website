import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_widget.dart';
import 'utils/screen/screen_size.dart';
import 'utils/service/http_service.dart';

class SharedModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<ScreenSize>(ScreenSize.new);
    i.addSingleton<AppWidget>(AppWidget.new);
    i.addSingleton<Dio>(() => Dio());
    i.addSingleton<HttpService>(HttpService.new);
  }
}
