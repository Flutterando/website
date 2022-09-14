import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutterando/app/modules/home/domain/entities/result_founders.dart';
import 'package:flutterando/app/utils/colors/colors.dart';
import 'package:flutterando/app/utils/icons/icons.dart';
import 'package:flutterando/app/utils/text_styles/text_styles.dart';

import '../founders_controller.dart';

class FounderItem extends StatefulWidget {
  final ResultFounders founder;
  FounderItem(this.founder);
  @override
  _FounderItemState createState() => _FounderItemState();
}

class _FounderItemState extends ModularState<FounderItem, FoundersController> {
  @override
  Widget build(BuildContext context) {
    final coOrganizer = widget.founder;
    final fontScale = controller.screen.fontScale(context);
    return Container(
      decoration: new BoxDecoration(
        color: GrayColors.gray02,
        borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
      ),
      margin: EdgeInsets.all(20),
      width: 130 * fontScale,
      height: 220 * fontScale,
      child: Column(
        children: [
          SizedBox(height: 26 * fontScale),
          CircleAvatar(
            radius: 30 * fontScale,
            child: Image.network(
              coOrganizer.pathImage,
              height: 56 * fontScale,
              fit: BoxFit.fitHeight,
            ),
            foregroundColor: Colors.black,
          ),
          Container(
            alignment: Alignment.center,
            height: 80 * fontScale,
            width: 110 * fontScale,
            child: SelectableText(
              coOrganizer.name,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyles.notoSans(17 * fontScale,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 6),
          InkWell(
            onTap: () {
              controller.urlLauncher.launchUrl(coOrganizer.linkedin);
            },
            child: SvgPicture.asset(
              IconUrls.linkedin,
              fit: BoxFit.fill,
              height: 30 * fontScale,
            ),
          ),
        ],
      ),
    );
  }
}
