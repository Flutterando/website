import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../partners_communities_store.dart';

class PartnerCommunitiesLogo extends StatefulWidget {
  final String photoUrl;
  final String name;
  final String siteUrl;
  PartnerCommunitiesLogo(this.photoUrl, this.name, this.siteUrl);
  @override
  _PartnerCommunitiesLogoState createState() => _PartnerCommunitiesLogoState();
}

class _PartnerCommunitiesLogoState extends State<PartnerCommunitiesLogo> {
  final controller = PartnersCommunitiesStore;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MouseRegion(
        child: GestureDetector(
          child: Row(
            children: [
              Image.network(
                widget.photoUrl,
                color: Colors.white,
                height: 120,
              ),
              Text(widget.name),
            ],
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
