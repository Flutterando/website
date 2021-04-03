import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando/app/modules/home/widgets/latest_meetups/latest_meetups_controller.dart';
import 'package:flutterando/app/modules/home/widgets/latest_meetups/widgets/meetup_tile.dart';
import 'package:flutterando/app/utils/colors/colors.dart';
import 'package:flutterando/app/utils/grids/number_grid_row_items_by_screen_size.dart';
import 'package:flutterando/app/utils/text_styles/text_styles.dart';

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
            'Últimos meetups',
            style: TextStyles.notoSans(
              25 * fontScale,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 28),
          SelectableText(
            'Fique por dentro dos nossos últimos encontros',
            style: TextStyles.roboto(
              11 * fontScale,
              fontWeight: FontWeight.normal,
            ),
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
}
