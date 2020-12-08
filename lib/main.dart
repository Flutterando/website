import 'package:flutter/material.dart';
import 'package:flutterando/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await DotEnv().load('.env');
  runApp(ModularApp(module: AppModule()));
}
