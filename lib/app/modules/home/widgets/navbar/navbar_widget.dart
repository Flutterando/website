import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando/app/modules/home/widgets/navbar/navbar_controller.dart';
import 'package:flutterando/app/utils/colors/colors.dart';
import 'package:flutterando/app/utils/images/images.dart';
import 'package:flutterando/app/utils/text_styles/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class NavbarWidget extends StatefulWidget {
  @override
  _NavbarWidgetState createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  final controller = Modular.get<NavbarController>();
  @override
  @override
  void dispose() {
    Modular.dispose<NavbarController>();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final screen = controller.screen;
    final fontScale = screen.fontScale(context);
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30 * fontScale),
        alignment: Alignment.centerLeft,
        height: 40 * fontScale,
        color: GrayColors.gray00,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(7 * fontScale),
                child: Image(
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.centerLeft,
                  image: AssetImage(ImageUrls.logoHorizontal),
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                await launchUrl(Uri.parse('https://forms.gle/6BoxwQLLBE2vZeMk6'));
              },
              child: Text(
                'Seja um palestrante',
                style: TextStyles.roboto(11 * fontScale, fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: () async {
                await launchUrl(Uri.parse('https://github.com/Flutterando/forum/discussions'));
              },
              child: Text(
                'Forum',
                style: TextStyles.roboto(11 * fontScale, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(width: 2 * fontScale),
            TextButton(
              onPressed: () async {
                await launchUrl(Uri.parse('https://masterclass.flutterando.com.br'));
              },
              child: Text(
                'Masterclass',
                style: TextStyles.roboto(11 * fontScale, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(width: 2 * fontScale),
            TextButton(
              onPressed: () async {
                await launchUrl(Uri.parse('https://linktr.ee/flutterando'));
              },
              child: Text(
                'Links Úteis',
                style: TextStyles.roboto(11 * fontScale, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
