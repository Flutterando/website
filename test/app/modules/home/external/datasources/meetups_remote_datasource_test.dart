import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_meetups.dart';
import 'package:flutterando/app/modules/home/external/datasources/meetups_remote_datasource.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock/meetups_data_mock.dart';

class DioSpy extends Mock implements Dio {}

class RequestOptionsMock extends Mock implements RequestOptions {}

main() {
  final dio = DioSpy();
  final datasource = MeetupsRemoteDatasource(dio);
  final _requestOptionsMock = RequestOptionsMock();

  test('Should return a list of ResultMeetupsModel', () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(data: meetupsDataMock, requestOptions: _requestOptionsMock, statusCode: 200));
    final result = await datasource.getMeetups();
    expect(result, isA<List<ResultMeetups>>());
  });
}
