import 'package:flutter/material.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_meetups.dart';
import 'package:flutterando/app/utils/text_styles/text_styles.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';

class MeetupTile extends StatelessWidget {
  final ResultMeetups meetup;
  MeetupTile(this.meetup);

  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return InkWell(
          onTap: () async {
            await launchUrl(Uri.parse(meetup.linkUrl));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: meetup.photoUrl,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SelectableText(
                meetup.title,
                style: TextStyles.notoSans(
                  24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SelectableText(
                        meetup.date,
                        textAlign: TextAlign.center,
                        style: TextStyles.roboto(
                          16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
