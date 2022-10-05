import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando/app/modules/home/widgets/partners/partners_controller.dart';
import 'package:flutterando/app/modules/home/widgets/partners/widgets/partner_logo.dart';
import 'package:flutterando/app/utils/colors/colors.dart';
import 'package:flutterando/app/utils/text_styles/text_styles.dart';
import 'package:localization/localization.dart';

class PartnersWidget extends StatefulWidget {
  @override
  _PartnersWidgetState createState() => _PartnersWidgetState();
}

class _PartnersWidgetState extends State<PartnersWidget> {
  final controller = Modular.get<PartnersController>();
  @override
  void dispose() {
    Modular.dispose<PartnersController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screen = controller.screen;
    final fontScale = screen.fontScale(context);
    final screenWidth = screen.atualScreenWidth(context: context);
    return Center(
      child: Container(
        color: GrayColors.gray01,
        width: screenWidth,
        padding: EdgeInsets.only(
          top: 55 * fontScale,
          left: (screenWidth / 15) * fontScale,
          right: (screenWidth / 15) * fontScale,
          bottom: 60 * fontScale,
        ),
        child: Column(
          children: [
            SelectableText(
              "title_partners".i18n(),
              style: TextStyles.notoSans(
                25 * fontScale,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SelectableText(
              "subtitle_partners".i18n(),
              style: TextStyles.roboto(
                11 * fontScale,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Observer(
              builder: (_) {
                if (controller.error.isNotEmpty) {
                  return SelectableText(
                    'Erro ao processar conteúdo',
                    style: TextStyles.roboto(30 * fontScale),
                  );
                }
                if (controller.partners.isEmpty) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 40 * fontScale,
                  runSpacing: 40 * fontScale,
                  runAlignment: WrapAlignment.center,
                  alignment: WrapAlignment.center,
                  children: controller.partners
                      .map((partner) =>
                          PartnerLogo(partner.photoUrl, partner.siteUrl))
                      .toList(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
