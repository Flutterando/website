import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando/app/modules/home/widgets/header/header_controller.dart';
import 'package:flutterando/app/modules/home/widgets/header/widgets/header_social_media.dart';
import 'package:flutterando/app/utils/images/images.dart';

class HeaderWidget extends StatefulWidget {
  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends ModularState<HeaderWidget, HeaderController> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = controller.screen.atualScreenWidth(context: context);
    final fontScale = controller.screen.fontScale(context);
    return Container(
      padding: EdgeInsets.only(
        top: 60 * fontScale,
        left: (screenWidth / 15) * fontScale,
        right: (screenWidth / 15) * fontScale,
      ),
      alignment: Alignment.center,
      width: screenWidth,
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            width: 270,
            child: Image.asset(
              ImageUrls.logoSymbol,
              width: screenWidth / 4,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: screenWidth < 900 ? null : EdgeInsets.all(40),
            width: screenWidth < 900 ? screenWidth * (2 / 3) : screenWidth / 2,
            child: HeaderSocialMedia(controller.screen),
          ),
          Container(height: 60 * controller.screen.fontScale(context))
        ],
      ),
    );
  }
}
