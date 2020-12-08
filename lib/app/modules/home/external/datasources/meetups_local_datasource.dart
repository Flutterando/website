import 'package:flutterando/app/data/meetups_data.dart';
import 'package:flutterando/app/modules/home/infra/datasources/meetups_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/result_meetups_model.dart';

class MeetupsLocalDatasource implements MeetupsDatasource {
  final MeetupsData meetups;
  MeetupsLocalDatasource(this.meetups);
  @override
  List<ResultMeetupsModel> getMeetups() {
    final response = meetups.get();
    final listMeetups = response
        .map(
          (e) => ResultMeetupsModel.fromMap(e),
        )
        .toList();
    return listMeetups;
  }
}
