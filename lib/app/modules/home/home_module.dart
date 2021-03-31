import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando/app/data/data.dart';

import 'domain/repositories/repositories.dart';
import 'domain/usecases/usecases.dart';
import 'external/datasources/datasources.dart';
import 'home_controller.dart';
import 'home_page.dart';
import 'infra/datasources/datasources.dart';
import 'infra/repositories/repositories.dart';
import 'widgets/widgets.dart';

class HomeModule extends ChildModule {
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

        //binds partners
        Bind((i) => PartnersData()),
        Bind<PartnersDatasource>((i) => PartnersLocalDatasource(i())),
        Bind<PartnersRepository>((i) => PartnersRepositoryImpl(i())),
        Bind<GetPartners>((i) => GetPartnersImpl(i())),

        //binds co_organizers
        Bind((i) => CoOrganizersData()),
        Bind<CoOrganizersDatasource>((i) => CoOrganizersLocalDatasource(i())),
        Bind<CoOrganizersRepository>((i) => CoOrganizersRepositoryImpl(i())),
        Bind<GetCoOrganizers>((i) => GetCoOrganizersImpl(i())),

        //binds packages
        Bind((i) => PackagesData()),
        Bind<PackagesDatasource>((i) => PackagesLocalDatasource(i())),
        Bind<PackagesRepository>((i) => PackagesRepositoryImpl(i())),
        Bind<GetPackages>((i) => GetPackagesImpl(i())),

        //binds brazilianCases
        Bind((i) => BrazilianCasesData()),
        Bind<BrazilianCasesDatasource>((i) => BrazilianCasesLocalDatasource(i())),
        Bind<BrazilianCasesRepository>((i) => BrazilianCasesRepositoryImpl(i())),
        Bind<GetBrazilianCases>((i) => GetBrazilianCasesImpl(i())),

        //binds brazilianCases
        Bind((i) => MeetupsData()),
        Bind<MeetupsDatasource>((i) => MeetupsLocalDatasource(i())),
        Bind<MeetupsRepository>((i) => MeetupsRepositoryImpl(i())),
        Bind<GetMeetups>((i) => GetMeetupsImpl(i())),

        //binds sendContact
        Bind<SendContactDatasource>((i) => SendContactServerDatasource(i())),
        Bind<SendContactRepository>((i) => SendContactRepositoryImpl(i())),
        Bind<SendContact>((i) => SendContactImpl(i())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
