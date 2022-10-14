import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_folower_numbers.dart';
import 'package:flutterando/app/modules/home/widgets/header/header_store.dart';
import 'package:flutterando/app/modules/home/widgets/partners_communities/partners_communities_store.dart';
import 'package:hasura_connect/hasura_connect.dart';

import 'domain/repositories/youtube_repository.dart';
import 'domain/usecases/get_brazilian_cases.dart';
import 'domain/usecases/get_co_organizers.dart';
import 'domain/usecases/get_founders.dart';
import 'domain/usecases/get_insta_followers.dart';
import 'domain/usecases/get_meetups.dart';
import 'domain/usecases/get_packages.dart';
import 'domain/usecases/get_partners_communities.dart';
import 'domain/usecases/get_partners.dart';
import 'domain/usecases/get_youtube.dart';
import 'domain/usecases/send_contact.dart';
import 'external/datasources/brazilian_cases_remote_datasource.dart';
import 'external/datasources/co_organizers_remote_datasource.dart';
import 'external/datasources/founders_remote_datasource.dart';
import 'external/datasources/insta_followers_datasource.dart';
import 'external/datasources/meetups_remote_datasource.dart';
import 'external/datasources/packages_remote_datasource.dart';
import 'external/datasources/partners_communities_remote_datasource.dart';
import 'external/datasources/partners_remote_datasource.dart';
import 'external/datasources/send_contact_server_datasource.dart';
import 'external/datasources/youtube_remote_datasource.dart';
import 'home_controller.dart';
import 'home_page.dart';
import 'infra/datasources/youtube_datasource.dart';
import 'infra/repositories/brazilian_cases_repository_impl.dart';
import 'infra/repositories/co_organizers_repository_impl.dart';
import 'infra/repositories/founders_repository_impl.dart';
import 'infra/repositories/insta_followers_repository_impl.dart';
import 'infra/repositories/meetups_repository_impl.dart';
import 'infra/repositories/packages_repository_impl.dart';
import 'infra/repositories/partner_communities_repository.impl.dart';
import 'infra/repositories/partners_repository_impl.dart';
import 'infra/repositories/send_contact_repository_impl.dart';
import 'infra/repositories/youtube_repository_impl.dart';
import 'widgets/brazilian_cases/brazilian_cases_controller.dart';
import 'widgets/co_organizers/co_organizers_store.dart';
import 'widgets/footer/footer_controller.dart';
import 'widgets/founders/founders_store.dart';
import 'widgets/latest_channel_videos/latest_channel_videos_store.dart';
import 'widgets/latest_meetups/latest_meetups_store.dart';
import 'widgets/navbar/navbar_controller.dart';
import 'widgets/packages/packages_store.dart';
import 'widgets/partners/partners_store.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i())),
        Bind((i) => NavbarController(i())),
        Bind((i) => PartnersStore(i(), i())),
        Bind((i) => FooterController(i(), i())),
        Bind((i) => PackagesStore(i(), i())),
        Bind((i) => FoundersStore(i(), i())),
        Bind((i) => CoOrganizersStore(i(), i())),
        Bind((i) => LatestMeetupsStore(i(), i())),
        Bind((i) => BrazilianCasesController(i(), i())),
        Bind((i) => PartnersCommunitiesStore(i(), i())),

        Bind((i) => LatestChannelVideosStore(i(), i())),
        Bind((i) => HeaderStore(i(), i())),
        //clean arch
        Bind((i) => HasuraConnect(
            "https://flutterando-fteam-box.herokuapp.com/v1/graphql")),
        Bind((i) => Dio()),

        //binds partners
        // Bind((i) => PartnersData()),
        Bind((i) => PartnersRemoteDatasource(i())),
        Bind((i) => PartnersRepositoryImpl(i())),
        Bind((i) => GetPartnersImpl(i())),

        //binds partnerCommunities
        Bind((i) => PartnersCommunitiesRemoteDatasource(i())),
        Bind((i) => PartnersCommunitiesRepositoryImpl(i())),
        Bind((i) => GetPartnersCommunitiesImpl(i())),

        //binds partnerCommunities
        //binds founders
        Bind((i) => FoundersRemoteDatasource(i())),
        Bind((i) => FoundersRepositoryImpl(i())),
        Bind((i) => GetFoundersImpl(i())),
        Bind((i) => GetFolowersNumbersImpl(i())),
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
        Bind((i) => SendContactServerDatasource(
              i(),
            )),
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
