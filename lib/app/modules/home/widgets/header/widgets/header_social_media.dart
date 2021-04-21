import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../data/followers_number.dart';
import '../../../../../utils/icons/icons.dart';
import '../../../../../utils/screen/screen_size.dart';
import '../../../../../utils/text_styles/text_styles.dart';
import '../../../../../utils/url_launcher/urls.dart';
import '../header_controller.dart';

class HeaderSocialMedia extends StatefulWidget {
  final ScreenSize screenSize;
  HeaderSocialMedia(this.screenSize);

  @override
  _HeaderSocialMediaState createState() => _HeaderSocialMediaState();
}

class _HeaderSocialMediaState
    extends ModularState<HeaderSocialMedia, HeaderController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SelectableText(
            'A maior comunidade de Flutter do Brasil',
            style: TextStyles.notoSans(
                (widget.screenSize.isMobile(context: context) ||
                        widget.screenSize.isWatch(context: context))
                    ? 36
                    : 56,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 40),
          SelectableText(
            'A Flutterando é a maior comunidade de Flutter no Brasil. Pensou em Flutter, pensou na Flutterando. Faça parte da nossa comunidade!',
            style: TextStyles.roboto(16, fontWeight: FontWeight.normal),
          ),
          SizedBox(height: 20),
          Observer(builder: (context) {
            return Container(
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.center,
                runSpacing: 30,
                spacing: 30,
                children: [
                  socialMediaIcon(
                    IconUrls.youtube,
                    urlLink: LinksUrl.youtube,
                    followersNumber: followersNumber['youtube'],
                  ),
                  socialMediaIcon(
                    IconUrls.instagram,
                    urlLink: LinksUrl.instagram,
                    followersNumber: controller.followers ?? '',
                  ),
                  socialMediaIcon(
                    IconUrls.twitter,
                    urlLink: LinksUrl.twitter,
                    followersNumber: followersNumber['twitter'],
                  ),
                  socialMediaIcon(
                    IconUrls.discord,
                    urlLink: LinksUrl.discord,
                    followersNumber: followersNumber['discord'],
                  ),
                  socialMediaIcon(
                    IconUrls.telegram,
                    urlLink: LinksUrl.telegram,
                    followersNumber: followersNumber['telegram'],
                  )
                ],
              ),
            );
          })
        ],
      ),
    );
  }

  Widget socialMediaIcon(String urlIcon,
      {required String urlLink, required String followersNumber}) {
    return InkWell(
      child: Container(
        width: 95,
        child: Row(
          children: [
            Image.asset(urlIcon),
            Container(
              width: 57,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  const Radius.circular(4.0),
                ),
              ),
              padding: EdgeInsets.all(6),
              child: Text(
                '${followersNumber}K',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
      onTap: () {
        controller.urlLauncher.launchUrl(urlLink);
      },
    );
  }
}
