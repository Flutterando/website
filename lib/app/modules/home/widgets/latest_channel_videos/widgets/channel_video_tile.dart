import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/screen/screen_size.dart';
import '../../../../../utils/text_styles/text_styles.dart';
import '../latest_channel_videos_controller.dart';

class ChannelVideoTile extends StatefulWidget {
  final Map<String, dynamic> video;
  ChannelVideoTile(this.video);

  @override
  _ChannelVideoTileState createState() => _ChannelVideoTileState();
}

class _ChannelVideoTileState
    extends ModularState<ChannelVideoTile, LatestChannelVideosController> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return InkWell(
          onTap: () {
            controller.urlLauncher.launchUrl(widget.video['linkUrl']);
          },
          child: Container(
            decoration: BoxDecoration(
              color: GrayColors.gray02,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            width: constraints.maxWidth,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  width: constraints.maxWidth,
                  height: constraints.maxWidth * 0.57,
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: widget.video['imgUrl'],
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: constraints.maxWidth / 15),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: constraints.maxWidth / 20),
                  width: constraints.maxWidth - 7,
                  child: SelectableText(
                    widget.video['title'],
                    maxLines:
                        (controller.screen.isDesktopXl(context: context) ||
                                controller.screen.isDesktopLg(context: context))
                            ? 2
                            : 1,
                    style: TextStyles.roboto(
                      fontSize(controller.screen, context),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: constraints.maxWidth / 15),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: constraints.maxWidth / 20),
                  width: constraints.maxWidth - 7,
                  child: SelectableText(
                    widget.video['date'],
                    style: TextStyles.roboto(
                      fontSize(controller.screen, context),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  double fontSize(ScreenSize screen, BuildContext context) {
    final factorFontText = screen.atualScreenWidth(context: context) / 2712;
    if (screen.isDesktopXl(context: context)) {
      return 18 * factorFontText * screen.fontScale(context);
    } else if (screen.isDesktopLg(context: context)) {
      return 18 * factorFontText * screen.fontScale(context) * (7 / 4);
    } else {
      return 14;
    }
  }
}
