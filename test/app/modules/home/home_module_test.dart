import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
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
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  initModules([
    AppModule(),
    HomeModule(),
  ], changeBinds: [
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

  test('Should return a list of ResultPartners', () {
    final usecase = Modular.get<GetPartners>();
    final result = usecase();
    expect(result | null, isA<List<ResultPartners>>());
  });

  test('Should return a list of ResultCoOrganizers', () {
    final usecase = Modular.get<GetCoOrganizers>();
    final result = usecase();
    expect(result | null, isA<List<ResultCoOrganizers>>());
  });

  test('Should return a list of Packages', () {
    final usecase = Modular.get<GetPackages>();
    final result = usecase();
    expect(result | null, isA<List<ResultPackage>>());
  });

  test('Should send a contact', () async {
    final contact = Contact(
      name: 'test name',
      email: 'test@test.com',
      message: 'this is a contact test',
    );
    when(dio.post(any, queryParameters: anyNamed('queryParameters')))
        .thenAnswer((_) async => Response(data: {}, statusCode: 201));
    final usecase = Modular.get<SendContact>();
    final result = await usecase(contact);
    expect(result | null, isA<ResultContact>());
  });
}
