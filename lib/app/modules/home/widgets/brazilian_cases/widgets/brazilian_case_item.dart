import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_brazilian_cases.dart';
import 'package:flutterando/app/modules/home/widgets/brazilian_cases/brazilian_cases_controller.dart';
import 'package:flutterando/app/utils/colors/colors.dart';
import 'package:flutterando/app/utils/screen/screen_size.dart';
import 'package:flutterando/app/utils/text_styles/text_styles.dart';

class BrazilianCaseItem extends StatefulWidget {
  final ResultBrazilianCases brazilianCase;
  BrazilianCaseItem(this.brazilianCase);
  @override
  _BrazilianCaseItemState createState() => _BrazilianCaseItemState();
}

class _BrazilianCaseItemState
    extends ModularState<BrazilianCaseItem, BrazilianCasesController> {
  @override
  Widget build(BuildContext context) {
    final brazilianCase = widget.brazilianCase;
    final screen = controller.screen;
    final fontScale = screen.fontScale(context);
    return LayoutBuilder(
      builder: (_, constraints) {
        return Container(
          decoration: BoxDecoration(
            color: GrayColors.gray02,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          padding: EdgeInsets.all(constraints.maxWidth / 17),
          width: constraints.maxWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                color: Colors.blue,
                // height: 4 / 10 * constraints.maxHeight,
                child: Image.network(
                  brazilianCase.imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: constraints.maxWidth / 22),
              SelectableText(
                brazilianCase.title,
                maxLines: 1,
                style: TextStyles.notoSans(
                  fontSize(screen, 30, context),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: constraints.maxWidth / 16),
              SelectableText(
                brazilianCase.description,
                maxLines: 4,
                style: TextStyles.roboto(
                  fontSize(screen, 16, context),
                  fontWeight: FontWeight.normal,
                ),
              ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: PrimaryColors.dark,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                height: 36 * fontScale,
                child: TextButton(
                  onPressed: () {
                    controller.urlLauncher.launchUrl(brazilianCase.url);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        //"button_cases".i18n(),
                        'Ver mais',
                        style: TextStyles.roboto(
                          fontSize(screen, 17, context),
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
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
      return fontSize * screen.fontScale(context) * 0.9;
    } else {
      return 15;
    }
  }
}
