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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: constraints.maxHeight / 40,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: widget.meetup.photoUrl,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: SelectableText(
                    widget.meetup.title,
                    style: TextStyles.notoSans(
                      22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SelectableText(
                            widget.meetup.date,
                            textAlign: TextAlign.center,
                            style: TextStyles.roboto(
                              16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
