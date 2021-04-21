import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../utils/colors/colors.dart';
import '../../../../utils/grids/number_grid_row_items_by_screen_size.dart';
import '../../../../utils/text_styles/text_styles.dart';
import 'brazilian_cases_controller.dart';
import 'widgets/brazilian_case_item.dart';

class BrazilianCasesWidget extends StatefulWidget {
  @override
  _BrazilianCasesWidgetState createState() => _BrazilianCasesWidgetState();
}

class _BrazilianCasesWidgetState
    extends ModularState<BrazilianCasesWidget, BrazilianCasesController> {
  @override
  Widget build(BuildContext context) {
    final screen = controller.screen;
    final screenWidth = screen.atualScreenWidth(context: context);
    final fontScale = screen.fontScale(context);
    final numberGridRowItemsByScreenSize =
        NumberGridRowItemsByScreenSize(1, 1, 2, 2, 3);
    final numberGridRowItems = screen.numberGridRowItems(
      screen,
      context,
      numberGridRowItemsByScreenSize,
    );
    return Container(
      width: screenWidth,
      padding: EdgeInsets.only(
        top: 60 * fontScale,
        left: (screenWidth / 15) * fontScale,
        right: (screenWidth / 15) * fontScale,
      ),
      color: GrayColors.gray00,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(
            'Cases brasileiros',
            style: TextStyles.notoSans(
              25 * fontScale,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 28),
          SelectableText(
            'Veja como empresas brasileiras estão tendo sucesso com o Flutter em suas aplicações',
            style: TextStyles.roboto(
              11 * fontScale,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 40 * fontScale),
          Observer(
            builder: (_) {
              if (controller.error.isNotEmpty) {
                return SelectableText(
                  'Erro ao processar conteúdo',
                  style: TextStyles.roboto(30 * fontScale),
                );
              }
              if (controller.brazilianCases.isEmpty) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.brazilianCases.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.75,
                    crossAxisCount: numberGridRowItems,
                    crossAxisSpacing: 15 * fontScale,
                    mainAxisSpacing: 15 * fontScale),
                itemBuilder: (_, index) {
                  return BrazilianCaseItem(controller.brazilianCases[index]);
                },
              );
            },
          ),
          SizedBox(height: 40 * fontScale),
        ],
      ),
    );
  }
}
