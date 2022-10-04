import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando/app/modules/home/widgets/latest_meetups/latest_meetups_controller.dart';
import 'package:flutterando/app/modules/home/widgets/latest_meetups/widgets/meetup_tile.dart';
import 'package:flutterando/app/utils/colors/colors.dart';
import 'package:flutterando/app/utils/grids/number_grid_row_items_by_screen_size.dart';
import 'package:flutterando/app/utils/text_styles/text_styles.dart';
import 'package:localization/localization.dart';

import '../../../../utils/screen/screen_size.dart';

class LatestMeetupsWidget extends StatefulWidget {
  @override
  _LatestMeetupsWidgetState createState() => _LatestMeetupsWidgetState();
}

class _LatestMeetupsWidgetState
    extends ModularState<LatestMeetupsWidget, LatestMeetupsController> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = controller.screen.atualScreenWidth(context: context);
    final screen = controller.screen;
    final fontScale = screen.fontScale(context);
    final numberGridRowItemsByScreenSize =
        NumberGridRowItemsByScreenSize(1, 1, 2, 2, 3);
    final numberGridRowItems = screen.numberGridRowItems(
        screen, context, numberGridRowItemsByScreenSize);
    return Container(
      padding: EdgeInsets.only(
        top: 60 * fontScale,
        left: (screenWidth / 15) * fontScale,
        right: (screenWidth / 15) * fontScale,
      ),
      color: GrayColors.gray01,
      width: screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(
            "title_meetups".i18n(),
            style: TextStyles.notoSans(
              25 * fontScale,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 28),
          Row(
            children: [
              SelectableText(
                "subtitle_meetups".i18n(),
                style: TextStyles.roboto(
                  11 * fontScale,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                width: 150,
                decoration: BoxDecoration(
                  color: PrimaryColors.dark,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                height: 22 * fontScale,
                child: TextButton(
                  onPressed: () {
                    controller.urlLauncher.launchUrl(
                        'https://www.youtube.com/playlist?list=PLlBnICoI-g-ddr7axgJZQeUdEtps-bKnp');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Ver mais',
                        style: TextStyles.roboto(
                          fontSize(screen, 17, context),
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 40 * fontScale),
          Observer(
            builder: (_) {
              if (controller.meetups.isNotEmpty) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.meetups.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.2,
                      crossAxisCount: numberGridRowItems,
                      crossAxisSpacing: 15 * fontScale,
                      mainAxisSpacing: 15 * fontScale),
                  itemBuilder: (_, index) {
                    return GridTile(
                      child: MeetupTile(controller.meetups[index]),
                    );
                  },
                );
              }
              return Container();
            },
          ),
          SizedBox(height: 50 * fontScale)
        ],
      ),
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
