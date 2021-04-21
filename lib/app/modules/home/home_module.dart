import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_brazilian_cases.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_co_organizers.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_insta_followers.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_meetups.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_packages.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_partners.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_youtube.dart';
import 'package:flutterando/app/modules/home/domain/usecases/send_contact.dart';
import 'package:flutterando/app/modules/home/external/datasources/brazilian_cases_remote_datasource.dart';
import 'package:flutterando/app/modules/home/external/datasources/insta_followers_datasource.dart';
import 'package:flutterando/app/modules/home/external/datasources/meetups_remote_datasource.dart';
import 'package:flutterando/app/modules/home/external/datasources/partners_remote_datasource.dart';
import 'package:flutterando/app/modules/home/external/datasources/send_contact_server_datasource.dart';
import 'package:flutterando/app/modules/home/infra/repositories/brazilian_cases_repository_impl.dart';
import 'package:flutterando/app/modules/home/infra/repositories/co_organizers_repository_impl.dart';
import 'package:flutterando/app/modules/home/infra/repositories/insta_followers_repository_impl.dart';
import 'package:flutterando/app/modules/home/infra/repositories/packages_repository_impl.dart';
import 'package:flutterando/app/modules/home/infra/repositories/partners_repository_impl.dart';
import 'package:flutterando/app/modules/home/infra/repositories/send_contact_repository_impl.dart';
import 'package:flutterando/app/modules/home/infra/repositories/youtube_repository_impl.dart';
import 'package:flutterando/app/modules/home/widgets/footer/footer_controller.dart';
import 'package:hasura_connect/hasura_connect.dart';

import 'domain/repositories/youtube_repository.dart';
import 'external/datasources/co_organizers_remote_datasource.dart';
import 'external/datasources/packages_remote_datasource.dart';
import 'external/datasources/youtube_remote_datasource.dart';
import 'home_controller.dart';
import 'home_page.dart';
import 'infra/datasources/youtube_datasource.dart';
import 'infra/repositories/meetups_repository_impl.dart';
import 'widgets/brazilian_cases/brazilian_cases_controller.dart';
import 'widgets/header/header_controller.dart';
import 'widgets/latest_channel_videos/latest_channel_videos_controller.dart';
import 'widgets/latest_meetups/latest_meetups_controller.dart';
import 'widgets/navbar/navbar_controller.dart';
import 'widgets/packages/packages_controller.dart';
import 'widgets/partners/partners_controller.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        $NavbarController,
        $PartnersController,
        $BrazilianCasesController,
        $PackagesController,
        $LatestChannelVideosController,
        $LatestMeetupsController,
        $HeaderController,
        $HomeController,
        $FooterController,

        //clean arch
        Bind((i) => HasuraConnect(env["urlSendContact"]!)),
        Bind((i) => Dio()),

        //binds partners
        // Bind((i) => PartnersData()),
        Bind((i) => PartnersRemoteDatasource(i())),
        Bind((i) => PartnersRepositoryImpl(i())),
        Bind((i) => GetPartnersImpl(i())),

        //binds co_organizers
        // Bind((i) => CoOrganizersData()),
        Bind((i) => CoOrganizersRemoteDatasource(i())),
        Bind((i) => CoOrganizersRepositoryImpl(i())),
        Bind((i) => GetCoOrganizersImpl(i())),

        //binds packages
        Bind((i) => PackagesRemoteDatasource(i())),
        Bind((i) => PackagesRepositoryImpl(i())),
        Bind((i) => GetPackagesImpl(i())),

        //binds brazilianCases
        // Bind((i) => BrazilianCasesData()),
        Bind((i) => BrazilianCasesRemoteDatasource(i())),
        Bind((i) => BrazilianCasesRepositoryImpl(i())),
        Bind((i) => GetBrazilianCasesImpl(i())),

        //binds brazilianCases
        // Bind((i) => MeetupsData()),
        Bind((i) => MeetupsRemoteDatasource(i())),
        Bind((i) => MeetupsRepositoryImpl(i())),
        Bind((i) => GetMeetupsImpl(i())),

        //binds sendContact
        Bind((i) => SendContactServerDatasource(i(), env)),
        Bind((i) => SendContactRepositoryImpl(i())),
        Bind((i) => SendContactImpl(i())),

        //binds Youtube
        Bind<YoutubeDatasource>((i) => YoutubeRemoteDatasource(i.get())),
        Bind<YoutubeRepository>((i) => YoutubeRepositoryImpl(i.get())),
        Bind<GetYoutube>((i) => GetYoutubeImpl(i.get())),

        Bind((i) => GetInstaFollowersImpl(i.get())),
        Bind((i) => InstaFollowersRepositoryImpl(i.get())),
        Bind((i) => InstaFollowersDatasourceImpl(i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
      ];
}
