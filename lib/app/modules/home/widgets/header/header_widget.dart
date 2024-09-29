import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando/app/modules/home/widgets/header/header_store.dart';
import 'package:flutterando/app/modules/home/widgets/header/widgets/header_social_media.dart';
import 'package:flutterando/app/utils/images/images.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  final controller = Modular.get<HeaderStore>();
  @override
  void dispose() {
    Modular.dispose<HeaderStore>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = controller.screen.atualScreenWidth(context: context);
    final fontScale = controller.screen.fontScale(context);
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(
        top: 60 * fontScale,
        //     left: (screenWidth / 15) * fontScale,
        //    right: (screenWidth / 15) * fontScale,
      ),
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            ImageUrls.backgroundBanner,
            height: size.height * 0.75,
            width: screenWidth,
            fit: BoxFit.cover,
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: SizedBox(
                      width: size.width * 0.05,
                      child: Image.asset(
                        ImageUrls.logoSymbol,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ), //
                  Container(
                    alignment: Alignment.center,
                    margin: screenWidth < 900 ? null : const EdgeInsets.symmetric(vertical: 32),
                    width: screenWidth < 900 ? screenWidth * (2 / 3) : screenWidth / 2,
                    child: HeaderSocialMedia(controller.screen),
                  ),
                  Container(
                    height: 48 * controller.screen.fontScale(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
