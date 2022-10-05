import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando/app/modules/home/widgets/packages/packages_controller.dart';
import 'package:flutterando/app/modules/home/widgets/packages/widgets/package_tile.dart';
import 'package:flutterando/app/utils/colors/colors.dart';
import 'package:flutterando/app/utils/grids/custom_scroll_behavior.dart';
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
    final screenWidth = screen.atualScreenWidth(context: context);
    return Container(
      padding: EdgeInsets.only(
        top: 60 * fontScale,
        bottom: 60 * fontScale,
      ),
      color: GrayColors.gray01,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: (screenWidth / 15) * fontScale,
              right: (screenWidth / 15) * fontScale,
            ),
            color: GrayColors.gray01,
            width: screenWidth,
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
              ],
            ),
          ),
          Observer(
            builder: (_) {
              if (controller.packages.isNotEmpty) {
                return Container(
                  height: 500,
                  color: GrayColors.gray01,
                  child: ScrollConfiguration(
                    behavior: CustomScrollBehavior(),
                    child: GridView.builder(
                      padding: EdgeInsets.only(
                        left: (screenWidth / 15) * fontScale,
                        right: (screenWidth / 15) * fontScale,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.packages.length,
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 664 / 487,
                        crossAxisCount: controller.packages.length > 10 ? 2 : 1,
                        crossAxisSpacing: 15 * fontScale,
                        mainAxisSpacing: 15 * fontScale,
                      ),
                      itemBuilder: (_, index) {
                        return PackageTile(controller.packages[index]);
                      },
                    ),
                  ),
                );
              }

              return Container();
            },
          ),
        ],
      ),
    );
  }
}
