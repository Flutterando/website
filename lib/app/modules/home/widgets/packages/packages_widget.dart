import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:flutterando/app/modules/home/widgets/packages/packages_store.dart';
import 'package:flutterando/app/modules/home/widgets/packages/widgets/package_tile.dart';
import 'package:flutterando/app/utils/colors/colors.dart';
import 'package:flutterando/app/utils/grids/custom_scroll_behavior.dart';
import 'package:flutterando/app/utils/text_styles/text_styles.dart';
import 'package:localization/localization.dart';

import '../../domain/entities/result_package.dart';
import '../../domain/errors/errors.dart';

class PackagesWidget extends StatefulWidget {
  @override
  _PackagesWidgetState createState() => _PackagesWidgetState();
}

class _PackagesWidgetState extends State<PackagesWidget> {
  final packageStore = Modular.get<PackagesStore>();
  @override
  @override
  void dispose() {
    Modular.dispose<PackagesStore>();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final screen = packageStore.screen;
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
          ScopedBuilder<PackagesStore, FailureGetPackages, List<ResultPackage>>(
            store: packageStore,
            onLoading: (context) => Center(
              child: CircularProgressIndicator(),
            ),
            onError: (context, error) => Center(
              child: Text(error.toString()),
            ),
            onState: (context, packages) {
              if (packages.isNotEmpty) {
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
                      itemCount: packages.length,
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 664 / 487,
                        crossAxisCount: packages.length > 10 ? 2 : 1,
                        crossAxisSpacing: 15 * fontScale,
                        mainAxisSpacing: 15 * fontScale,
                      ),
                      itemBuilder: (_, index) {
                        return PackageTile(packages[index]);
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
