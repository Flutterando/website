import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando/app/modules/home/widgets/packages/packages_controller.dart';
import 'package:flutterando/app/modules/home/widgets/packages/widgets/package_tile.dart';
import 'package:flutterando/app/utils/colors/colors.dart';
import 'package:flutterando/app/utils/grids/number_grid_row_items_by_screen_size.dart';
import 'package:flutterando/app/utils/text_styles/text_styles.dart';
import 'package:localization/localization.dart';

class PackagesWidget extends StatefulWidget {
  @override
  _PackagesWidgetState createState() => _PackagesWidgetState();
}

class _PackagesWidgetState extends State<PackagesWidget> {
  final controller = Modular.get<PackagesController>();
  @override
  @override
  void dispose() {
    Modular.dispose<PackagesController>();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final screen = controller.screen;
    final fontScale = screen.fontScale(context);
    final numberGridRowItemsByScreenSize =
        NumberGridRowItemsByScreenSize(1, 2, 3, 3, 4);
    final numberGridRowItems = screen.numberGridRowItems(
        screen, context, numberGridRowItemsByScreenSize);
    final screenWidth = screen.atualScreenWidth(context: context);
    return Container(
      width: screenWidth,
      padding: EdgeInsets.only(
        top: 60 * fontScale,
        left: (screenWidth / 15) * fontScale,
        right: (screenWidth / 15) * fontScale,
      ),
      color: GrayColors.gray01,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(
            "title_packages".i18n(),
            style: TextStyles.notoSans(
              25 * fontScale,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 28),
          SelectableText(
            "subtitle_packages".i18n(),
            style: TextStyles.roboto(
              11 * fontScale,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 40 * fontScale),
          Observer(
            builder: (_) {
              if (controller.packages.isNotEmpty) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.packages.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.72,
                      crossAxisCount: numberGridRowItems,
                      crossAxisSpacing: 15 * fontScale,
                      mainAxisSpacing: 15 * fontScale),
                  itemBuilder: (_, index) {
                    return GridTile(
                      child: PackageTile(controller.packages[index]),
                    );
                  },
                );
              }

              return Container();
            },
          ),
          SizedBox(height: 55 * fontScale),
        ],
      ),
    );
  }
}
