import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando/app/utils/colors/colors.dart';
import 'package:flutterando/app/utils/screen/screen_size.dart';
import 'package:flutterando/app/utils/text_styles/text_styles.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../domain/entities/result_partner_communities.dart';
import '../partner_communities_controller.dart';

class PartnerCommunitiesItem extends StatefulWidget {
  final ResultPartnerCommunities partnerCommunities;
  const PartnerCommunitiesItem(this.partnerCommunities, {super.key});
  @override
  _PartnerCommunitiesItemState createState() => _PartnerCommunitiesItemState();
}

class _PartnerCommunitiesItemState extends State<PartnerCommunitiesItem> {
  final controller = Modular.get<PartnerCommunitiesController>();

  @override
  void dispose() {
    Modular.dispose<PartnerCommunitiesController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final partnerCommunities = widget.partnerCommunities;
    final screen = controller.screen;
    final fontScale = screen.fontScale(context);
    return LayoutBuilder(
      builder: (_, constraints) {
        return Container(
          decoration: const BoxDecoration(
            color: GrayColors.gray02,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          padding: EdgeInsets.all(constraints.maxWidth / 17),
          width: constraints.maxWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.black,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: partnerCommunities.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: constraints.maxWidth / 22),
              SelectableText(
                partnerCommunities.title,
                maxLines: 1,
                style: TextStyles.notoSans(
                  fontSize(screen, 30, context),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: constraints.maxWidth / 16),
              SelectableText(
                partnerCommunities.description,
                maxLines: 4,
                style: TextStyles.roboto(
                  fontSize(screen, 16, context),
                  fontWeight: FontWeight.normal,
                ),
              ),
              const Spacer(),
              Container(
                decoration: const BoxDecoration(
                  color: PrimaryColors.carmesim,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                height: 36 * fontScale,
                child: TextButton(
                  onPressed: () async {
                    await launchUrl(Uri.parse(partnerCommunities.url));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        //"button_cases".i18n(),
                        'Ver mais',
                        style: TextStyles.roboto(
                          fontSize(screen, 17, context),
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  double fontSize(ScreenSize screen, double fontSize, BuildContext context) {
    final factorFontText = screen.atualScreenWidth(context: context) / 2712;
    if (screen.isDesktopXl(context: context)) {
      return fontSize * factorFontText * screen.fontScale(context);
    } else if (screen.isDesktopLg(context: context)) {
      return fontSize * factorFontText * screen.fontScale(context) * (9 / 4);
    } else if (screen.isTablet(context: context) || screen.isMobile(context: context)) {
      return fontSize * screen.fontScale(context) * 0.9;
    } else {
      return 15;
    }
  }
}
