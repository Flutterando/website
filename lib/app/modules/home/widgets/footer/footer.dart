import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../utils/screen/screen_size.dart';
import 'contact_form/contact_form.dart';
import 'follow_us/follow_us.dart';
import 'footer_controller.dart';

class Footer extends StatefulWidget {
  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends ModularState<Footer, FooterController> {
  @override
  Widget build(BuildContext context) {
    final screen = controller.screen;
    final fontScale = screen.fontScale(context);
    final screenWidth = screen.atualScreenWidth(context: context);
    return Container(
      alignment: Alignment.topCenter,
      width: screenWidth,
      margin: EdgeInsets.only(
        top: 60 * fontScale,
        left: (screenWidth / 15) * fontScale,
        right: (screenWidth / 15) * fontScale,
      ),
      color: Colors.transparent,
      child: Column(
        children: [
          elemetsFooter(screen),
          SizedBox(height: 85 * screen.fontScale(context))
        ],
      ),
    );
  }

  Widget elemetsFooter(ScreenSize screen) {
    if (screen.atualScreenWidth(context: context) < 858) {
      return Column(
        children: [
          ContactForm(),
          SizedBox(height: 20),
          FollowUs(),
        ],
      );
    }

    return Row(
      children: [
        ContactForm(),
        SizedBox(width: 20),
        Spacer(),
        FollowUs(),
      ],
    );
  }
}
