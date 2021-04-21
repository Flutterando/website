import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/icons/icons.dart';
import '../../../../../utils/screen/screen_size.dart';
import '../../../../../utils/text_styles/text_styles.dart';
import '../../../domain/entities/result_package.dart';
import '../packages_controller.dart';

class PackageTile extends StatefulWidget {
  final ResultPackage package;
  PackageTile(this.package);
  @override
  _PackageTileState createState() => _PackageTileState();
}

class _PackageTileState extends ModularState<PackageTile, PackagesController> {
  @override
  Widget build(BuildContext context) {
    final package = widget.package;
    final screen = controller.screen;
    final fontScale = screen.fontScale(context);
    return LayoutBuilder(
      builder: (_, constraints) {
        final maxWidth = constraints.maxWidth;
        return Container(
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
            color: GrayColors.gray02,
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          width: constraints.maxWidth,
          padding: EdgeInsets.only(
              left: maxWidth / 16,
              right: maxWidth / 16,
              bottom: maxWidth / 16,
              top: maxWidth / 12),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                IconUrls.package,
                fit: BoxFit.cover,
                width: 38 * fontScale,
              ),
              SizedBox(height: constraints.maxWidth / 15),
              SelectableText(
                package.name,
                maxLines: 1,
                style: TextStyles.roboto(
                  fontSize(screen, 20, context),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: constraints.maxWidth / 15),
              SelectableText(
                package.author,
                maxLines: 1,
                style: TextStyles.roboto(
                  fontSize(screen, 15, context),
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: constraints.maxWidth / 15),
              Image.network(
                package.version,
              ),
              SizedBox(height: constraints.maxWidth / 15),
              SelectableText(
                package.description,
                maxLines: 3,
                style: TextStyles.roboto(
                  fontSize(screen, 15, context),
                  fontWeight: FontWeight.normal,
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: maxWidth / 8 * fontScale,
                  width: double.infinity,
                  color: PrimaryColors.dark,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => PrimaryColors.dark),
                    ),
                    // color: PrimaryColors.dark,
                    onPressed: () {
                      controller.urlLauncher.launchUrl(package.url);
                    },
                    child: Text(
                      'Acessar',
                      style: TextStyles.roboto(12 * fontScale),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  double fontSize(ScreenSize screen, double fontSize, BuildContext context) {
    final factorFontText = screen.atualScreenWidth(context: context) / 2712;
    if (screen.isDesktopXl(context: context)) {
      return fontSize * factorFontText * screen.fontScale(context);
    } else if (screen.isDesktopLg(context: context)) {
      return fontSize * factorFontText * screen.fontScale(context) * (9 / 4);
    } else if (screen.isTablet(context: context) ||
        screen.isMobile(context: context)) {
      return fontSize * screen.fontScale(context) * 0.9 - 2;
    } else {
      return 18;
    }
  }
}
