import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_founders.dart';
import 'package:flutterando/app/utils/colors/colors.dart';
import 'package:flutterando/app/utils/icons/icons.dart';
import 'package:flutterando/app/utils/text_styles/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../founders_controller.dart';

class FounderItem extends StatefulWidget {
  final ResultFounders founder;
  FounderItem(this.founder);
  @override
  _FounderItemState createState() => _FounderItemState();
}

class _FounderItemState extends State<FounderItem> {
  final controller = Modular.get<FoundersController>();
  void dispose() {
    Modular.dispose<FoundersController>();
    super.dispose();
  }

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
          Container(
            width: 70 * fontScale,
            height: 70 * fontScale,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: Color(0xffFFD700),
                width: 2,
              ),
            ),
            child: ClipOval(
              child: Image.network(
                coOrganizer.pathImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 80 * fontScale,
            width: 110 * fontScale,
            child: Row(
              children: [
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: SelectableText(
                      coOrganizer.name,
                      textAlign: TextAlign.center,
                      style: TextStyles.notoSans(17 * fontScale, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 6),
          InkWell(
            onTap: () async {
              await launchUrl(Uri.parse(coOrganizer.linkedin));
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
