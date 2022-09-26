import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando/app/app_module.dart';
import 'package:flutterando/app/app_widget.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
