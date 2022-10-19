import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:flutterando/app/modules/home/widgets/partners_communities/partners_communities_store.dart';
import 'package:flutterando/app/modules/home/widgets/partners_communities/widgets/partners_communities_logo.dart';
import 'package:flutterando/app/utils/colors/colors.dart';
import 'package:flutterando/app/utils/text_styles/text_styles.dart';
import 'package:localization/localization.dart';

import '../../domain/entities/result_partners_communities.dart';
import '../../domain/errors/errors.dart';

class PartnersCommunitiesWidget extends StatefulWidget {
  @override
  _PartnersCommunitiesWidgetState createState() =>
      _PartnersCommunitiesWidgetState();
}

class _PartnersCommunitiesWidgetState extends State<PartnersCommunitiesWidget> {
  final partnerCommunitiesStore = Modular.get<PartnersCommunitiesStore>();
  @override
  void dispose() {
    Modular.dispose<PartnersCommunitiesStore>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screen = partnerCommunitiesStore.screen;
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
              "title_partners_communities".i18n(),
              style: TextStyles.notoSans(
                25 * fontScale,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SelectableText(
              "subtitle_partners_communities".i18n(),
              style: TextStyles.roboto(
                11 * fontScale,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ScopedBuilder<PartnersCommunitiesStore,
                FailureGetPartnersCommunities, List<ResultPartnersCommunities>>(
              store: partnerCommunitiesStore,
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
                  children: state
                      .map((partnerCommunities) => PartnerCommunitiesLogo(
                          partnerCommunities.photoUrl,
                          partnerCommunities.name,
                          partnerCommunities.siteUrl))
                      .toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
