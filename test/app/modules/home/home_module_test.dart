import 'package:dartz/dartz.dart' hide Bind;
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/app/app_module.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_co_organizers.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_package.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_partners.dart';
import 'package:flutterando/app/modules/home/domain/entities/send_contact/contact.dart';
import 'package:flutterando/app/modules/home/domain/entities/send_contact/result_contact.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_co_organizers.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_packages.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_partners.dart';
import 'package:flutterando/app/modules/home/domain/usecases/send_contact.dart';
import 'package:flutterando/app/modules/home/home_module.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_test/modular_test.dart';

class DioMock extends Mock implements Dio {}

class HasuraConnectSpy extends Mock implements HasuraConnect {}

main() {
  final dio = DioMock();
  final connection = HasuraConnectSpy();

  initModules([
    AppModule(),
    HomeModule(),
  ], replaceBinds: [
    Bind<Dio>((i) => dio),
  ]);

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

  test('Should return a list of ResultPartners', () async {
    final usecase = Modular.get<GetPartners>();
    final result = await usecase();
    expect(result.getOrElse(() => []), isA<List<ResultPartners>>());
  });

  test('Should return a list of ResultCoOrganizers', () async {
    final usecase = Modular.get<GetCoOrganizers>();
    final result = await usecase();
    expect(result.getOrElse(() => []), isA<List<ResultCoOrganizers>>());
  });

  test('Should return a list of Packages', () async {
    final usecase = Modular.get<GetPackages>();
    final result = await usecase();
    expect(result.getOrElse(() => []), isA<List<ResultPackage>>());
  });

  test('Should send a contact', () async {
    final contact = Contact(
      name: 'test name',
      email: 'test@test.com',
      message: 'this is a contact test',
    );
    when(() => connection.mutation(any(), variables: any(named: 'variables')))
        .thenAnswer((invocation) async => {
              "data": {
                "insert_mail_box": {"affected_rows": 1}
              }
            });
    final usecase = Modular.get<SendContact>();
    final result = await usecase(contact);
    expect(result.fold(id, id), isA<ResultContact>());
  });
}
