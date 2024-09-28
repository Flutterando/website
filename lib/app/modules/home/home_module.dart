import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_follower_numbers.dart';
import 'package:flutterando/app/modules/home/widgets/header/header_store.dart';
import 'package:flutterando/app/modules/home/widgets/partner_communities/partner_communities_controller.dart';
import 'package:flutterando/app/shared_module.dart';
import 'package:hasura_connect/hasura_connect.dart';

import 'domain/repositories/brazilian_cases_repository.dart';
import 'domain/repositories/co_organizers_repository.dart';
import 'domain/repositories/founders_repository.dart';
import 'domain/repositories/insta_followers_repository.dart';
import 'domain/repositories/meetups_repository.dart';
import 'domain/repositories/packages_repository.dart';
import 'domain/repositories/partner_communities_repository.dart';
import 'domain/repositories/partners_repository.dart';
import 'domain/repositories/send_contact_repository.dart';
import 'domain/repositories/youtube_repository.dart';
import 'domain/usecases/get_brazilian_cases.dart';
import 'domain/usecases/get_co_organizers.dart';
import 'domain/usecases/get_founders.dart';
import 'domain/usecases/get_insta_followers.dart';
import 'domain/usecases/get_meetups.dart';
import 'domain/usecases/get_packages.dart';
import 'domain/usecases/get_partner_communities.dart';
import 'domain/usecases/get_partners.dart';
import 'domain/usecases/get_youtube.dart';
import 'domain/usecases/send_contact.dart';
import 'external/datasources/brazilian_cases_remote_datasource.dart';
import 'external/datasources/co_organizers_remote_datasource.dart';
import 'external/datasources/founders_remote_datasource.dart';
import 'external/datasources/insta_followers_datasource.dart';
import 'external/datasources/meetups_remote_datasource.dart';
import 'external/datasources/packages_remote_datasource.dart';
import 'external/datasources/partner_communities_remote_datasource.dart';
import 'external/datasources/partners_remote_datasource.dart';
import 'external/datasources/send_contact_server_datasource.dart';
import 'external/datasources/youtube_remote_datasource.dart';
import 'home_controller.dart';
import 'home_page.dart';
import 'infra/datasources/brazilian_cases_datasource.dart';
import 'infra/datasources/co_organizers_datasource.dart';
import 'infra/datasources/founders_datasource.dart';
import 'infra/datasources/insta_followers_datasource.dart';
import 'infra/datasources/meetups_datasource.dart';
import 'infra/datasources/packages_datasource.dart';
import 'infra/datasources/partner_communities_datasource.dart';
import 'infra/datasources/partners_datasource.dart';
import 'infra/datasources/send_contact_datasource.dart';
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
  List<Module> get imports => [
        SharedModule(),
      ];

  @override
  void binds(Injector i) {
    i.addSingleton(HomeController.new);
    i.addSingleton(NavbarController.new);
    i.addSingleton(PartnersStore.new);
    i.addSingleton(FooterController.new);
    i.addSingleton(PackagesStore.new);
    i.addSingleton(FoundersStore.new);
    i.addSingleton(CoOrganizersStore.new);
    i.addSingleton(LatestMeetupsStore.new);
    i.addSingleton(BrazilianCasesController.new);
    i.addSingleton(PartnerCommunitiesController.new);

    i.addSingleton(LatestChannelVideosStore.new);
    i.addSingleton(HeaderStore.new);
    //clean arch
    i.addSingleton<HasuraConnect>(() => HasuraConnect("https://flutterando-fteam-box.herokuapp.com/v1/graphql"));

    //binds partners
    // Bind((i) => PartnersData()),
    i.addSingleton<PartnersDatasource>(PartnersRemoteDatasource.new);
    i.addSingleton<PartnersRepository>(PartnersRepositoryImpl.new);
    i.addSingleton<GetPartners>(GetPartnersImpl.new);

    //binds founders
    i.addSingleton<FoundersDatasource>(FoundersRemoteDatasource.new);
    i.addSingleton<FoundersRepository>(FoundersRepositoryImpl.new);
    i.addSingleton<GetFounders>(GetFoundersImpl.new);
    i.addSingleton<GetFollowersNumbers>(GetFolowersNumbersImpl.new);
    //binds co_organizers
    // Bind((i) => CoOrganizersData()),
    i.addSingleton<CoOrganizersDatasource>(CoOrganizersRemoteDatasource.new);
    i.addSingleton<CoOrganizersRepository>(CoOrganizersRepositoryImpl.new);
    i.addSingleton<GetCoOrganizers>(GetCoOrganizersImpl.new);

    //binds packages
    i.addSingleton<PackagesDatasource>(PackagesRemoteDatasource.new);
    i.addSingleton<PackagesRepository>(PackagesRepositoryImpl.new);
    i.addSingleton<GetPackages>(GetPackagesImpl.new);

    //binds brazilianCases
    // Bind((i) => BrazilianCasesData()),
    i.addSingleton<BrazilianCasesDatasource>(BrazilianCasesRemoteDatasource.new);
    i.addSingleton<BrazilianCasesRepository>(BrazilianCasesRepositoryImpl.new);
    i.addSingleton<GetBrazilianCases>(GetBrazilianCasesImpl.new);

    //binds brazilianCases
    //binds partnerCommunities
    i.addSingleton<PartnerCommunitiesDatasource>(PartnerCommunitiesRemoteDatasource.new);
    i.addSingleton<PartnerCommunitiesRepository>(PartnerCommunitiesRepositoryImpl.new);
    i.addSingleton<GetPartnerCommunities>(GetPartnerCommunitiesImpl.new);

    //binds partnerCommunities
    // Bind((i) => MeetupsData()),
    i.addSingleton<MeetupsDatasource>(MeetupsRemoteDatasource.new);
    i.addSingleton<MeetupsRepository>(MeetupsRepositoryImpl.new);
    i.addSingleton<GetMeetups>(GetMeetupsImpl.new);

    //binds sendContact
    i.addSingleton<SendContactDatasource>(SendContactServerDatasource.new);
    i.addSingleton<SendContactRepository>(SendContactRepositoryImpl.new);
    i.addSingleton<SendContact>(SendContactImpl.new);

    //binds Youtube
    i.addSingleton<YoutubeDatasource>(YoutubeRemoteDatasource.new);
    i.addSingleton<YoutubeRepository>(YoutubeRepositoryImpl.new);
    i.addSingleton<GetYoutube>(GetYoutubeImpl.new);

    i.addSingleton<GetInstaFollowers>(GetInstaFollowersImpl.new);
    i.addSingleton<InstaFollowersRepository>(InstaFollowersRepositoryImpl.new);
    i.addSingleton<InstaFollowersDatasource>(InstaFollowersDatasourceImpl.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (_) => const HomePage());
  }
}
