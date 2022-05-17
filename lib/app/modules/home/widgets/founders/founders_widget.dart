import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando/app/utils/text_styles/text_styles.dart';
import 'package:localization/localization.dart';

import 'founders_controller.dart';
import 'widgets/founder_item.dart';

class Founders extends StatefulWidget {
  @override
  _FoundersState createState() => _FoundersState();
}

class _FoundersState extends ModularState<Founders, FoundersController> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final screen = controller.screen;
        final screenWidth = screen.atualScreenWidth(context: context);
        final fontScale = screen.fontScale(context);

        final isError = controller.error.isNotEmpty;
        final isReleaseError = isError && !kDebugMode;
        final isLoading = !isError && controller.founders.isEmpty;
        final isState = !isError && !isLoading;

        if (isReleaseError) return Container();

        return Container(
          width: screenWidth,
          padding: EdgeInsets.only(
            top: 50 * fontScale,
            left: (screenWidth / 15) * fontScale,
            right: (screenWidth / 15) * fontScale,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                "title_founders".i18n(),
                style: TextStyles.notoSans(
                  25 * fontScale,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 32 * fontScale),
              SelectableText(
                "subtitle_founders".i18n(),
                style: TextStyles.roboto(
                  11 * fontScale,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 50 * fontScale),
              if (isError) ...{
                SelectableText('Erro ao processar conteúdo', style: TextStyles.roboto(30 * fontScale)),
              },
              if (isLoading) ...{
                Center(child: CircularProgressIndicator()),
              },
              if (isState) ...{
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.center,
                    children: controller.founders.map((founder) => FounderItem(founder)).toList(),
                  ),
                ),
              },
              SizedBox(height: 60 * fontScale)
            ],
          ),
        );
      },
    );
  }
}
