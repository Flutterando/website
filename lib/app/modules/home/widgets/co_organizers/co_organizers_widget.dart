import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando/app/modules/home/widgets/co_organizers/co_organizers_controller.dart';
import 'package:flutterando/app/modules/home/widgets/co_organizers/widgets/co_organizer_item.dart';
import 'package:flutterando/app/utils/text_styles/text_styles.dart';

class CoOrganizers extends StatefulWidget {
  @override
  _CoOrganizersState createState() => _CoOrganizersState();
}

class _CoOrganizersState
    extends ModularState<CoOrganizers, CoOrganizersController> {
  @override
  Widget build(BuildContext context) {
    final screen = controller.screen;
    final fontScale = screen.fontScale(context);
    final screenWidth = screen.atualScreenWidth(context: context);
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
            'Coorganizadores',
            style: TextStyles.notoSans(
              25 * fontScale,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 32 * fontScale),
          SelectableText(
            'Conheça a turma que faz a comunidade acontecer',
            style: TextStyles.roboto(
              11 * fontScale,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 50 * fontScale),
          Observer(
            builder: (_) {
              if (controller.error != null) {
                return SelectableText(
                  'Erro ao processar conteúdo',
                  style: TextStyles.roboto(30 * fontScale),
                );
              }
              if (controller.coOrganizers == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.center,
                    children: controller.coOrganizers
                        .map((coOrganizer) => CoOrganizerItem(coOrganizer))
                        .toList()),
              );
            },
          ),
          SizedBox(height: 60 * fontScale)
        ],
      ),
    );
  }
}
