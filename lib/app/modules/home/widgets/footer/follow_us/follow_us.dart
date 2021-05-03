import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando/app/modules/home/widgets/footer/follow_us/widgets/social_networks.dart';
import 'package:flutterando/app/modules/home/widgets/footer/footer_controller.dart';
import 'package:flutterando/app/utils/images/images.dart';
import 'package:flutterando/app/utils/text_styles/text_styles.dart';

class FollowUs extends StatefulWidget {
  @override
  _FollowUsState createState() => _FollowUsState();
}

class _FollowUsState extends ModularState<FollowUs, FooterController> {
  @override
  Widget build(BuildContext context) {
    final fontScale = controller.screen.fontScale(context);
    return Container(
      alignment: Alignment.topRight,
      width: 260 * fontScale,
      padding: EdgeInsets.only(
        bottom: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset(
            ImageUrls.logoHorizontalBig,
            width: 300 * fontScale,
            height: 60 * fontScale,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 38 * fontScale),
          SelectableText(
            //"footer_social_media".i18n(),
            'Siga-nos nas redes sociais',
            style:
                TextStyles.roboto(16 * fontScale, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 13),
          SocialNetworks(fontScale),
          SizedBox(height: 60),
          SelectableText(
            //"footer_contact".i18n(),
            'Contato',
            style: TextStyles.notoSans(24 * fontScale,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 13),
          SelectableText(
            'contato@flutterando.com.br',
            style: TextStyles.roboto(16 * fontScale,
                fontWeight: FontWeight.normal),
          ),
          SizedBox(height: 45),
          InkWell(
            onTap: () {
              controller.urlLauncher
                  .launchUrl('https://f-team.dev/desenvolvimento');
            },
            child: Text(
              'Powered by F-team',
              style: TextStyles.roboto(16, fontWeight: FontWeight.bold),
            ),
          ),
          SelectableText(
            'Developed with Flutter Web',
            textAlign: TextAlign.right,
            style: TextStyles.roboto(16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 34),
          SelectableText(
            'Copyright © Flutterando 2020 - Todos os direitos reservados',
            style: TextStyles.roboto(9 * fontScale),
          )
        ],
      ),
    );
  }
}
