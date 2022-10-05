import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ['assets/lang/'];

    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutterando',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          LocalJsonLocalization.delegate,
        ],
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate);
  }
}
