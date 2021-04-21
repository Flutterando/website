import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../utils/colors/colors.dart';
import '../../utils/widgets/scroll_bar/scroll_bar_widget.dart';
import 'home_controller.dart';
import 'widgets/brazilian_cases/brazilian_cases_widget.dart';
import 'widgets/co_organizers/co_organizers_widget.dart';
import 'widgets/footer/footer.dart';
import 'widgets/header/header_widget.dart';
import 'widgets/latest_channel_videos/latest_channel_videos_widget.dart';
import 'widgets/latest_meetups/latest_meetups_widget.dart';
import 'widgets/navbar/navbar_widget.dart';
import 'widgets/packages/packages_widget.dart';
import 'widgets/partners/partners_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GrayColors.gray00,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(children: [
                HeaderWidget(),
                LatestMeetupsWidget(),
                LatestChannelVideosWidget(),
                CoOrganizers(),
                PackagesWidget(),
                BrazilianCasesWidget(),
                PartnersWidget(),
                Footer(),
              ]),
            ),
          ),
          Align(
            child: Banner(
              child: NavbarWidget(),
              location: BannerLocation.topEnd,
              message: "Flutter",
            ),
            alignment: Alignment.topCenter,
          ),
          ScrollBarWidget(_scrollController),
        ],
      ),
    );
  }
}
