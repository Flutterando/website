import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:flutterando/app/modules/home/widgets/partners/partners_store.dart';
import 'package:flutterando/app/modules/home/widgets/partners/widgets/partner_logo.dart';
import 'package:flutterando/app/utils/colors/colors.dart';
import 'package:flutterando/app/utils/text_styles/text_styles.dart';
import 'package:localization/localization.dart';

import '../../domain/entities/result_partners.dart';
import '../../domain/errors/errors.dart';

class PartnersWidget extends StatefulWidget {
  @override
  _PartnersWidgetState createState() => _PartnersWidgetState();
}

class _PartnersWidgetState extends State<PartnersWidget> {
  final partnerStore = Modular.get<PartnersStore>();
  @override
  void dispose() {
    Modular.dispose<PartnersStore>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screen = partnerStore.screen;
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
            ScopedBuilder<PartnersStore, FailureGetPartners, List<ResultPartners>>(
              store: partnerStore,
              onLoading: (context) => Center(
                child: CircularProgressIndicator(),
              ),
              onError: (context, error) => SelectableText(
                'Erro ao processar conteúdo',
                style: TextStyles.roboto(30 * fontScale),
              ),
              onState: (context, state) {
                if (state.isEmpty) {
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
                  children: state.map((partner) => PartnerLogo(partner.photoUrl, partner.siteUrl)).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
