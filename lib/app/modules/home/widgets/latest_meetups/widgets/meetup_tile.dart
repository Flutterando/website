import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_meetups.dart';
import 'package:flutterando/app/modules/home/widgets/latest_meetups/latest_meetups_controller.dart';
import 'package:flutterando/app/utils/text_styles/text_styles.dart';
import 'package:transparent_image/transparent_image.dart';

class MeetupTile extends StatefulWidget {
  final ResultMeetups meetup;
  MeetupTile(this.meetup);

  @override
  _MeetupTileState createState() => _MeetupTileState();
}

class _MeetupTileState
    extends ModularState<MeetupTile, LatestMeetupsController> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return InkWell(
          onTap: () {
            controller.urlLauncher.launchUrl(widget.meetup.linkUrl);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            width: constraints.maxWidth,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Colors.blue,
                      ),

                      // width: constraints.maxWidth,
                      // height: constraints.maxWidth * 0.65,
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: widget.meetup.photoUrl,
                      ),
                    ),
                ),
                SizedBox(height: constraints.maxWidth / 40),
                Container(
                  width: constraints.maxWidth - 7,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SelectableText(
                      widget.meetup.title,
                      style: TextStyles.notoSans(
                        18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  width: constraints.maxWidth - 7,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: SelectableText(
                      widget.meetup.date,
                      style: TextStyles.roboto(12, fontWeight: FontWeight.bold),
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
}
