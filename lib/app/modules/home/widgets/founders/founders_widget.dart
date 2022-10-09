import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:flutterando/app/utils/text_styles/text_styles.dart';
import 'package:localization/localization.dart';

import '../../domain/entities/result_founders.dart';
import '../../domain/errors/errors.dart';
import 'founders_store.dart';
import 'widgets/founder_item.dart';

class Founders extends StatefulWidget {
  @override
  _FoundersState createState() => _FoundersState();
}

class _FoundersState extends State<Founders> {
  final store = Modular.get<FoundersStore>();
  void dispose() {
    Modular.dispose<FoundersStore>();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final screen = store.screen;
    final screenWidth = screen.atualScreenWidth(context: context);
    final fontScale = screen.fontScale(context);
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
          ScopedBuilder<FoundersStore, FailureGetFounders, List<ResultFounders>>(
              store: store,
              onLoading: (context) => Center(child: CircularProgressIndicator()),
              onError: (context, error) => SelectableText('Erro ao processar conteúdo', style: TextStyles.roboto(30 * fontScale)),
              onState: (context, founders) {
                return Container(
                  alignment: Alignment.bottomLeft,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    alignment: WrapAlignment.start,
                    children: founders.map((founder) => FounderItem(founder)).toList(),
                  ),
                );
              }),
          SizedBox(height: 60 * fontScale)
        ],
      ),
    );
  }
}
