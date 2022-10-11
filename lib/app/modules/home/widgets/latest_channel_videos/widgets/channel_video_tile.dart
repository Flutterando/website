import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_youtube.dart';
import 'package:flutterando/app/modules/home/widgets/latest_channel_videos/latest_channel_videos_store.dart';
import 'package:flutterando/app/utils/colors/colors.dart';
import 'package:flutterando/app/utils/screen/screen_size.dart';
import 'package:flutterando/app/utils/text_styles/text_styles.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';

class ChannelVideoTile extends StatefulWidget {
  final ResultYoutube video;
  ChannelVideoTile(this.video);

  @override
  _ChannelVideoTileState createState() => _ChannelVideoTileState();
}

class _ChannelVideoTileState extends State<ChannelVideoTile> {
  final controller = Modular.get<LatestChannelVideosStore>();
  @override
  void dispose() {
    Modular.dispose<LatestChannelVideosStore>();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return InkWell(
          onTap: () async {
            await launchUrl(Uri.parse(widget.video.linkUrl));
          },
          child: Container(
            decoration: BoxDecoration(
              color: GrayColors.gray02,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            width: constraints.maxWidth,
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage, 
                        image: widget.video.imgUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: constraints.maxWidth / 15),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: constraints.maxWidth / 20),
                  width: constraints.maxWidth - 7,
                  child: SelectableText(
                    widget.video.title,
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
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: constraints.maxWidth / 20),
                  width: constraints.maxWidth - 7,
                  child: SelectableText(
                    widget.video.date,
                    style: TextStyles.roboto(18, fontWeight: FontWeight.bold),
                  ),
                ),
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
