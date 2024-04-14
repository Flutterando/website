import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_folowers_numbers.dart';
import 'package:flutterando/app/modules/home/widgets/header/header_store.dart';
import 'package:flutterando/app/utils/icons/icons.dart';
import 'package:flutterando/app/utils/screen/screen_size.dart';
import 'package:flutterando/app/utils/text_styles/text_styles.dart';
import 'package:flutterando/app/utils/url_launcher/urls.dart';
import 'package:localization/localization.dart';
import 'package:url_launcher/url_launcher.dart';

class HeaderSocialMedia extends StatefulWidget {
  final ScreenSize screenSize;
  const HeaderSocialMedia(this.screenSize, {super.key});

  @override
  State<HeaderSocialMedia> createState() => _HeaderSocialMediaState();
}

class _HeaderSocialMediaState extends State<HeaderSocialMedia> {
  final headerStore = Modular.get<HeaderStore>();

  @override
  void initState() {
    super.initState();
    headerStore.load();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SelectableText(
            "title_header".i18n(),
            style: TextStyles.notoSans((widget.screenSize.isMobile(context: context) || widget.screenSize.isWatch(context: context)) ? 36 : 56, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          SelectableText(
            "subtitle_header".i18n(),
            style: TextStyles.roboto(
              16,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 20),
          ValueListenableBuilder<ResultFolowers>(
              valueListenable: headerStore,
              builder: (context, value, child) {
                return SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    runSpacing: 30,
                    spacing: 30,
                    children: [
                      socialMediaIcon(
                        IconUrls.youtube,
                        urlLink: LinksUrl.youtube,
                        followersNumber: value.youtube,
                      ),
                      socialMediaIcon(
                        IconUrls.instagram,
                        urlLink: LinksUrl.instagram,
                        followersNumber: value.instagram,
                      ),
                      socialMediaIcon(
                        IconUrls.twitter,
                        urlLink: LinksUrl.twitter,
                        followersNumber: value.twitter,
                      ),
                      socialMediaIcon(
                        IconUrls.discord,
                        urlLink: LinksUrl.discord,
                        followersNumber: value.discord,
                      ),
                      socialMediaIcon(
                        IconUrls.telegram,
                        urlLink: LinksUrl.telegram,
                        followersNumber: value.telegram,
                      ),
                      socialMediaIcon(
                        IconUrls.facebook,
                        urlLink: LinksUrl.facebook,
                        followersNumber: value.facebook,
                      ),
                      socialMediaIcon(
                        IconUrls.linkedin,
                        urlLink: LinksUrl.linkedin,
                        followersNumber: value.linkedin,
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }

  Widget socialMediaIcon(String urlIcon, {required String urlLink, required String followersNumber}) {
    return InkWell(
      child: SizedBox(
        width: 98,
        height: 35,
        child: Row(
          children: [
            SvgPicture.asset(urlIcon),
            Container(
              width: 50,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
              ),
              padding: const EdgeInsets.all(4),
              child: Text(
                '${followersNumber}K',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
      onTap: () async {
        await launchUrl(Uri.parse(urlLink));
      },
    );
  }
}
