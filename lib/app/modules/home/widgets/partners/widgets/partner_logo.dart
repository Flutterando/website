import 'package:flutter/material.dart';
import 'package:flutterando/app/modules/home/widgets/partners/partners_store.dart';
import 'package:url_launcher/url_launcher.dart';

class PartnerLogo extends StatefulWidget {
  final String photoUrl;
  final String siteUrl;
  PartnerLogo(this.photoUrl, this.siteUrl);
  @override
  _PartnerLogoState createState() => _PartnerLogoState();
}

class _PartnerLogoState extends State<PartnerLogo> {
  final controller = PartnersStore;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MouseRegion(
        child: GestureDetector(
          child: Image.network(
            widget.photoUrl,
            color: Colors.white,
            height: 120,
          ),
          onTap: () async {
            await launchUrl(Uri.parse(widget.siteUrl));
          },
        ),
        cursor: SystemMouseCursors.click,
      ),
    );
  }
}
