import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:flutterando/app/modules/home/widgets/latest_channel_videos/latest_channel_videos_store.dart';
import 'package:flutterando/app/utils/colors/colors.dart';
import 'package:flutterando/app/utils/text_styles/text_styles.dart';
import 'package:localization/localization.dart';

import '../../../../utils/grids/custom_scroll_behavior.dart';
import '../../domain/entities/result_youtube.dart';
import '../../domain/errors/errors.dart';
import 'widgets/channel_video_tile.dart';

class LatestChannelVideosWidget extends StatefulWidget {
  @override
  _LatestChannelVideosWidgetState createState() => _LatestChannelVideosWidgetState();
}

class _LatestChannelVideosWidgetState extends State<LatestChannelVideosWidget> {
  final latestChannelVideosStore = Modular.get<LatestChannelVideosStore>();
  @override
  void dispose() {
    Modular.dispose<LatestChannelVideosStore>();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final screenWidth = latestChannelVideosStore.screen.atualScreenWidth(context: context);
    final screen = latestChannelVideosStore.screen;
    final fontScale = screen.fontScale(context);

    return Container(
      padding: EdgeInsets.only(
        top: 40 * fontScale,
      ),
      color: GrayColors.gray01,
      width: screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: (screenWidth / 15) * fontScale,
              right: (screenWidth / 15) * fontScale,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SelectableText(
                  "title_video_channel".i18n(),
                  style: TextStyles.notoSans(
                    25 * fontScale,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 28),
                SelectableText(
                  "subtitle_video_channel".i18n(),
                  style: TextStyles.roboto(
                    11 * fontScale,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 40 * fontScale),
              ],
            ),
          ),
          ScopedBuilder<LatestChannelVideosStore, FailureGetYoutube, List<ResultYoutube>>(
              store: latestChannelVideosStore,
              onLoading: (context) => Center(
                    child: CircularProgressIndicator(),
                  ),
              onError: (context, error) => Center(
                    child: Text(error.toString()),
                  ),
              onState: (context, youtube) {
                if (youtube.isNotEmpty) {
                  return SizedBox(
                    height: 300 * fontScale,
                    child: ScrollConfiguration(
                      behavior: CustomScrollBehavior(),
                      child: GridView.builder(
                        padding: EdgeInsets.only(
                          left: (screenWidth / 15) * fontScale,
                          right: (screenWidth / 15) * fontScale,
                        ),
                        physics: BouncingScrollPhysics(),
                        itemCount: youtube.length,
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: .9,
                          crossAxisCount: 1,
                          crossAxisSpacing: 15 * fontScale,
                          mainAxisSpacing: 15 * fontScale,
                        ),
                        itemBuilder: (_, index) {
                          return ChannelVideoTile(youtube[index]);
                        },
                      ),
                    ),
                  );
                }

                return Container();
              }),
          SizedBox(height: 50 * fontScale)
        ],
      ),
    );
  }
}
