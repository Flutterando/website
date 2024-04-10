import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:flutterando/app/modules/home/widgets/co_organizers/co_organizers_store.dart';
import 'package:flutterando/app/modules/home/widgets/co_organizers/widgets/co_organizer_item.dart';
import 'package:flutterando/app/utils/text_styles/text_styles.dart';
import 'package:localization/localization.dart';

import '../../domain/entities/result_co_organizers.dart';

class CoOrganizers extends StatefulWidget {
  const CoOrganizers({super.key});

  @override
  _CoOrganizersState createState() => _CoOrganizersState();
}

class _CoOrganizersState extends State<CoOrganizers> {
  final coOrganizersStore = Modular.get<CoOrganizersStore>();
  @override
  @override
  void dispose() {
    Modular.dispose<CoOrganizersStore>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screen = coOrganizersStore.screen;
    final fontScale = screen.fontScale(context);
    final screenWidth = screen.atualScreenWidth(context: context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 50 * fontScale,
            left: (screenWidth / 15) * fontScale,
            right: (screenWidth / 15) * fontScale,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                "title_coorganizers".i18n(),
                style: TextStyles.notoSans(
                  25 * fontScale,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 32 * fontScale),
              SelectableText(
                "subtitle_coorganizers".i18n(),
                style: TextStyles.roboto(
                  11 * fontScale,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 50 * fontScale),
            ],
          ),
        ),
        ScopedBuilder<CoOrganizersStore, List<ResultCoOrganizers>>(
          store: coOrganizersStore,
          onError: (context, error) => SelectableText(
            'Erro ao processar conteúdo',
            style: TextStyles.roboto(30 * fontScale),
          ),
          onLoading: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
          onState: (context, coOrganizers) => Container(
            height: 300 * fontScale,
            alignment: Alignment.center,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(
                left: (screenWidth / 15) * fontScale,
                right: (screenWidth / 15) * fontScale,
              ),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: coOrganizers.map((coOrganizer) => CoOrganizerItem(coOrganizer)).toList(),
            ),
          ),
        ),
        SizedBox(height: 60 * fontScale)
      ],
    );
  }
}
