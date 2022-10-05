import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterando/app/modules/home/widgets/footer/footer_controller.dart';
import 'package:flutterando/app/utils/icons/icons.dart';
import 'package:flutterando/app/utils/url_launcher/urls.dart';

class SocialNetworks extends StatefulWidget {
  final double fontScale;
  SocialNetworks(this.fontScale);

  @override
  _SocialNetworksState createState() => _SocialNetworksState();
}

class _SocialNetworksState extends State<SocialNetworks> {
  final controller = Modular.get<FooterController>();
  @override
  void dispose() {
    Modular.dispose<FooterController>();
    super.dispose();
  }

  Widget build(BuildContext context) {
    Widget socialnetWork(String image, String linkUrl) {
      return InkWell(
        onTap: () {
          controller.urlLauncher.launchUrl(linkUrl);
        },
        child: Container(
          child: SvgPicture.asset(
            image,
            height: 20 * widget.fontScale,
            width: 20 * widget.fontScale,
            fit: BoxFit.cover,
          ),
          padding: EdgeInsets.only(
            left: 10 * widget.fontScale,
          ),
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
