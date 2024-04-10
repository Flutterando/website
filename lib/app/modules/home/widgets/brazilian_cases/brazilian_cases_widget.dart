import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:flutterando/app/modules/home/widgets/brazilian_cases/brazilian_cases_controller.dart';
import 'package:flutterando/app/modules/home/widgets/brazilian_cases/widgets/brazilian_case_item.dart';
import 'package:flutterando/app/utils/colors/colors.dart';
import 'package:flutterando/app/utils/grids/custom_scroll_behavior.dart';
import 'package:flutterando/app/utils/text_styles/text_styles.dart';
import 'package:localization/localization.dart';

import '../../domain/entities/result_brazilian_cases.dart';

class BrazilianCasesWidget extends StatefulWidget {
  const BrazilianCasesWidget({super.key});

  @override
  _BrazilianCasesWidgetState createState() => _BrazilianCasesWidgetState();
}

class _BrazilianCasesWidgetState extends State<BrazilianCasesWidget> {
  final controller = Modular.get<BrazilianCasesController>();
  @override
  void dispose() {
    Modular.dispose<BrazilianCasesController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screen = controller.screen;
    final screenWidth = screen.atualScreenWidth(context: context);
    final fontScale = screen.fontScale(context);

    return Container(
      width: screenWidth,
      color: GrayColors.gray00,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 60 * fontScale,
              left: (screenWidth / 15) * fontScale,
              right: (screenWidth / 15) * fontScale,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SelectableText(
                  "title_cases".i18n(),
                  style: TextStyles.notoSans(
                    25 * fontScale,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 28),
                SelectableText(
                  "subtitle_cases".i18n(),
                  style: TextStyles.roboto(
                    11 * fontScale,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 40 * fontScale),
              ],
            ),
          ),
          ScopedBuilder<BrazilianCasesController, List<ResultBrazilianCases>>(
            store: controller,
            onError: (context, error) => SelectableText(
              'Erro ao processar conteúdo',
              style: TextStyles.roboto(30 * fontScale),
            ),
            onLoading: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
            onState: (context, brazilianCases) {
              return SizedBox(
                height: 400 * fontScale,
                child: ScrollConfiguration(
                  behavior: CustomScrollBehavior(),
                  child: GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(
                      left: (screenWidth / 15) * fontScale,
                      right: (screenWidth / 15) * fontScale,
                    ),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: brazilianCases.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 863 / 648,
                      crossAxisCount: 1,
                      crossAxisSpacing: 15 * fontScale,
                      mainAxisSpacing: 15 * fontScale,
                    ),
                    itemBuilder: (_, index) {
                      return BrazilianCaseItem(brazilianCases[index]);
                    },
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 40 * fontScale),
        ],
      ),
    );
  }
}
