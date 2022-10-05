import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_co_organizers.dart';
import 'package:flutterando/app/modules/home/widgets/co_organizers/co_organizers_controller.dart';
import 'package:flutterando/app/utils/colors/colors.dart';
import 'package:flutterando/app/utils/icons/icons.dart';
import 'package:flutterando/app/utils/text_styles/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return AspectRatio(
      aspectRatio: 0.6,
      child: Container(
        padding: EdgeInsets.all(36),
        decoration: new BoxDecoration(
          color: GrayColors.gray02,
          borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          ),
        ),
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 70 * fontScale,
              height: 70 * fontScale,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: Color(0xffC0c0c0),
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
            SelectableText(
              coOrganizer.name,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyles.notoSans(17 * fontScale, fontWeight: FontWeight.bold),
            ),
            SelectableText(
              coOrganizer.status,
              textAlign: TextAlign.center,
              style: TextStyles.roboto(14 * fontScale, fontWeight: FontWeight.normal),
            ),
            InkWell(
              onTap: () async {
                await launchUrl(Uri.parse(coOrganizer.linkedin));
              },
              child: SvgPicture.asset(
                IconUrls.linkedin,
                fit: BoxFit.contain,
                height: 30 * fontScale,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
