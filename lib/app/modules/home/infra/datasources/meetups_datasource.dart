import 'package:flutterando/app/modules/home/domain/entities/result_meetups.dart';

abstract class MeetupsDatasource {
  Future<List<ResultMeetups>> getMeetups();
}
