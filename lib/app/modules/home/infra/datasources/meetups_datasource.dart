import 'package:flutterando/app/modules/home/infra/models/result_meetups_model.dart';

abstract class MeetupsDatasource {
  Future<List<ResultMeetupsModel>> getMeetups();
}
