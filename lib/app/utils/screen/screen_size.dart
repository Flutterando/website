import 'package:flutter/cupertino.dart';
import 'package:flutterando/app/utils/grids/number_grid_row_items_by_screen_size.dart';

// part 'screen_size.g.dart';

class ScreenSize {
  bool isDesktopXl({required BuildContext context}) {
    return MediaQuery.of(context).size.width >= 1280.0;
  }

  bool isDesktopLg({required BuildContext context}) {
    return MediaQuery.of(context).size.width >= 800.0 && MediaQuery.of(context).size.width < 1280.0;
  }

  bool isTablet({required BuildContext context}) {
    return MediaQuery.of(context).size.width >= 599.0 && MediaQuery.of(context).size.width < 800.0;
  }

  bool isMobile({required BuildContext context}) {
    return MediaQuery.of(context).size.width >= 375.0 && MediaQuery.of(context).size.width < 599.0;
  }

  bool isWatch({required BuildContext context}) {
    return MediaQuery.of(context).size.width < 375.0;
  }

  double atualScreenWidth({required BuildContext context}) {
    return MediaQuery.of(context).size.width;
  }

  double fontScale(BuildContext context) {
    if (isDesktopXl(context: context)) {
      return 1.5;
    } else if (isDesktopLg(context: context)) {
      return 1.0;
    } else if (isTablet(context: context) || isMobile(context: context)) {
      return 0.8;
    } else if (isWatch(context: context)) {
      return 0.7;
    }

    return 0.7;
  }

  int numberGridRowItems(
    ScreenSize screen,
    BuildContext context,
    NumberGridRowItemsByScreenSize numberItemsRow,
  ) {
    if (screen.isWatch(context: context)) {
      return numberItemsRow.watch;
    }
    if (screen.isMobile(context: context)) {
      return numberItemsRow.mobile;
    }
    if (screen.isTablet(context: context)) {
      return numberItemsRow.tablet;
    }
    if (screen.isDesktopLg(context: context)) {
      return numberItemsRow.desktopLg;
    }
    if (screen.isDesktopXl(context: context)) {
      return numberItemsRow.desktopXl;
    }

    return numberItemsRow.desktopXl;
  }

  double gridElementSize(int numberGridRowItems, maxWidth) {
    double disponibleWidth = (maxWidth - (numberGridRowItems - 1) * (maxWidth / 30)) as double;
    double sizeElementGrid = disponibleWidth / numberGridRowItems;
    return sizeElementGrid;
  }
}
