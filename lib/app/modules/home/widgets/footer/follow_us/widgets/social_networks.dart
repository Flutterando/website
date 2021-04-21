import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../utils/icons/icons.dart';
import '../../../../../../utils/url_launcher/urls.dart';
import '../../footer_controller.dart';

class SocialNetworks extends StatefulWidget {
  final double fontScale;
  SocialNetworks(this.fontScale);

  @override
  _SocialNetworksState createState() => _SocialNetworksState();
}

class _SocialNetworksState
    extends ModularState<SocialNetworks, FooterController> {
  @override
  Widget build(BuildContext context) {
    Widget socialnetWork(String image, String linkUrl) {
      return InkWell(
        onTap: () {
          controller.urlLauncher.launchUrl(linkUrl);
        },
        child: Container(
          child: Image.asset(
            image,
            height: 22 * widget.fontScale,
            width: 22 * widget.fontScale,
            fit: BoxFit.cover,
          ),
          padding: EdgeInsets.only(left: 10 * widget.fontScale),
        ),
      );
    }

    return Container(
      child: Wrap(
        alignment: WrapAlignment.end,
        children: [
          socialnetWork(IconUrls.instagram, LinksUrl.instagram),
          socialnetWork(IconUrls.facebook, LinksUrl.facebook),
          socialnetWork(IconUrls.twitter, LinksUrl.twitter),
          socialnetWork(IconUrls.telegram, LinksUrl.telegram),
          socialnetWork(IconUrls.discord, LinksUrl.discord),
          socialnetWork(IconUrls.medium, LinksUrl.medium),
          socialnetWork(IconUrls.youtube, LinksUrl.youtube),
          socialnetWork(IconUrls.meetup, LinksUrl.meetup),
        ],
      ),
    );
  }
}
