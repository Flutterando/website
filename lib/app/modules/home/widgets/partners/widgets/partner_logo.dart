import 'package:flutter/material.dart';
import 'package:flutterando/app/modules/home/widgets/partners/partners_controller.dart';

class PartnerLogo extends StatefulWidget {
  final String photoUrl;
  PartnerLogo(this.photoUrl);
  @override
  _PartnerLogoState createState() => _PartnerLogoState();
}

class _PartnerLogoState extends State<PartnerLogo> {
  final controller = PartnersController;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        widget.photoUrl,
        color: Colors.white,
        height: 120,
      ),
    );
  }
}
