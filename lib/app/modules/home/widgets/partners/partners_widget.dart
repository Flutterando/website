import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../utils/colors/colors.dart';
import '../../../../utils/text_styles/text_styles.dart';
import 'partners_controller.dart';
import 'widgets/partner_logo.dart';

class PartnersWidget extends StatefulWidget {
  @override
  _PartnersWidgetState createState() => _PartnersWidgetState();
}

class _PartnersWidgetState
    extends ModularState<PartnersWidget, PartnersController> {
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
              'Parceiros',
              style: TextStyles.notoSans(
                25 * fontScale,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SelectableText(
              'Estas são as empresas que apoiam nossa comunidade',
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
                      .map((partner) => PartnerLogo(partner.photoUrl))
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
