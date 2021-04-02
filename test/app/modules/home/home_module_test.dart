import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/src/core/models/bind.dart' as bindModular;
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/app/app_module.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_co_organizers.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_package.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_partners.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_co_organizers.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_packages.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_partners.dart';
import 'package:flutterando/app/modules/home/domain/usecases/send_contact.dart';
import 'package:flutterando/app/modules/home/home_module.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();

  initModules([
    AppModule(),
    HomeModule(),
  ], replaceBinds: [
    bindModular.Bind<Dio>((i) => dio),
  ]);

  setUp(() async {
    await DotEnv.testLoad();
  });
  test('Should return the usercase without error', () {
    final usecasePartners = Modular.get<GetPartners>();
    expect(usecasePartners, isA<GetPartnersImpl>());

    final usecaseCoOrganizers = Modular.get<GetCoOrganizers>();
    expect(usecaseCoOrganizers, isA<GetCoOrganizersImpl>());

    final usecasePackages = Modular.get<GetPackages>();
    expect(usecasePackages, isA<GetPackagesImpl>());

    final usecaseSendContact = Modular.get<SendContact>();
    expect(usecaseSendContact, isA<SendContactImpl>());
  });

  test('Should return a list of ResultPartners', () {
    final usecase = Modular.get<GetPartners>();
    final result = usecase();
    expect(result.getOrElse(() => []), isA<List<ResultPartners>>());
  });

  test('Should return a list of ResultCoOrganizers', () {
    final usecase = Modular.get<GetCoOrganizers>();
    final result = usecase();
    expect(result.getOrElse(() => []), isA<List<ResultCoOrganizers>>());
  });

  test('Should return a list of Packages', () {
    final usecase = Modular.get<GetPackages>();
    final result = usecase();
    expect(result.getOrElse(() => []), isA<List<ResultPackage>>());
  });

  test('Should send a contact', () async {
    // final contact = Contact(
    //   name: 'test name',
    //   email: 'test@test.com',
    //   message: 'this is a contact test',
    // );

    when(() => dio.post("url", queryParameters: {"":""}))
        .thenAnswer((_) async => Response(data: {}, statusCode: 201, requestOptions: RequestOptions(path: "")));

    // var contactNew = ContactModel(name: "Flutterando", message:"Hi!", email: "flutterando@flutterando.com.br");
    // when(() => dio.get(any(), queryParameters: contactNew.toMap()))
    //     .thenAnswer((_) async => Response(data: {}, statusCode: 201, requestOptions: _requestOptionsMock));

    // final usecase = Modular.get<SendContact>();
    // final result = await usecase(contact);
    // expect(result.fold(id, id), isA<ResultContact>());
  });
}
