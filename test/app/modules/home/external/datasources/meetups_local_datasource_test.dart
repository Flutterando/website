import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/app/data/meetups_data.dart';
import 'package:flutterando/app/modules/home/external/datasources/meetups_local_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/result_meetups_model.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock/meetups_data_mock.dart';

class MeetupsDataMock extends Mock implements MeetupsData {}

main() {
  final meetups = MeetupsDataMock();
  final datasource = MeetupsLocalDatasource(meetups);
  test('Should return a list of ResultMeetupsModel', () {
    when(() => meetups.get()).thenAnswer((_) => meetupsDataMock);
    final result = datasource.getMeetups();
    expect(result, isA<List<ResultMeetupsModel>>());
  });
}
