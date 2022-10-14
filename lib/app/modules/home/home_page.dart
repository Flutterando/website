import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando/app/modules/home/widgets/footer/footer.dart';
import 'package:flutterando/app/modules/home/widgets/navbar/navbar_widget.dart';
import 'package:flutterando/app/modules/home/widgets/partners_communities/partners_communities_widget.dart';
import 'package:flutterando/app/utils/colors/colors.dart';
import 'package:flutterando/app/utils/grids/custom_scroll_behavior.dart';

import 'home_controller.dart';
import 'widgets/brazilian_cases/brazilian_cases_widget.dart';
import 'widgets/co_organizers/co_organizers_widget.dart';
import 'widgets/founders/founders_widget.dart';
import 'widgets/header/header_widget.dart';
import 'widgets/latest_channel_videos/latest_channel_videos_widget.dart';
import 'widgets/latest_meetups/latest_meetups_widget.dart';
import 'widgets/packages/packages_widget.dart';
import 'widgets/partners/partners_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();

  @override
  void dispose() {
    Modular.dispose<HomeController>();
    super.dispose();
  }

  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GrayColors.gray00,
      body: ScrollConfiguration(
        behavior: CustomScrollBehavior(),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(children: [
                  HeaderWidget(),
                  LatestMeetupsWidget(),
                  LatestChannelVideosWidget(),
                  Founders(),
                  CoOrganizers(),
                  PackagesWidget(),
                  BrazilianCasesWidget(),
                  PartnersCommunitiesWidget(),
                  PartnersWidget(),
                  Footer()
                ]),
              ),
              Align(
                child: Banner(
                  child: NavbarWidget(),
                  location: BannerLocation.topEnd,
                  message: "Flutter",
                ),
                alignment: Alignment.topCenter,
              ),
              // ScrollBarWidget(_scrollController),
            ],
          ),
        ),
      ),
    );
  }
}
