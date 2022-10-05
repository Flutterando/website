import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_co_organizers.dart';
import 'package:flutterando/app/modules/home/widgets/co_organizers/co_organizers_controller.dart';
import 'package:flutterando/app/utils/colors/colors.dart';
import 'package:flutterando/app/utils/icons/icons.dart';
import 'package:flutterando/app/utils/text_styles/text_styles.dart';

class CoOrganizerItem extends StatefulWidget {
  final ResultCoOrganizers coOrganizer;
  CoOrganizerItem(this.coOrganizer);

  @override
  _CoOrganizerItemState createState() => _CoOrganizerItemState();
}

class _CoOrganizerItemState extends State<CoOrganizerItem> {
  final controller = Modular.get<CoOrganizersController>();

  @override
  void dispose() {
    Modular.dispose<ResultCoOrganizers>();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final coOrganizer = widget.coOrganizer;
    final fontScale = controller.screen.fontScale(context);
    return Container(
      decoration: new BoxDecoration(
        color: GrayColors.gray02,
        borderRadius: const BorderRadius.all(
          const Radius.circular(10.0),
        ),
      ),
      margin: EdgeInsets.all(20),
      width: 130 * fontScale,
      height: 250 * fontScale,
      child: Column(
        children: [
          SizedBox(height: 26 * fontScale),
          CircleAvatar(
            radius: 30 * fontScale,
            child: Image.network(
              coOrganizer.pathImage,
              height: 51 * fontScale,
              fit: BoxFit.contain,
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
          SelectableText(
            coOrganizer.status,
            textAlign: TextAlign.center,
            style: TextStyles.roboto(14 * fontScale,
                fontWeight: FontWeight.normal),
          ),
          SizedBox(height: 16 * fontScale),
          InkWell(
            onTap: () {
              controller.urlLauncher.launchUrl(coOrganizer.linkedin);
            },
            child: SvgPicture.asset(
              IconUrls.linkedin,
              fit: BoxFit.contain,
              height: 30 * fontScale,
            ),
          ),
        ],
      ),
    );
  }
}
