import 'package:dio/dio.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_insta_followers.dart';
import 'package:flutterando/app/modules/home/infra/datasources/insta_followers_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/result_insta_followers_model.dart';
import 'package:flutterando/app/utils/url_launcher/urls.dart';

import '../../domain/errors/errors_send_contact.dart';

class InstaFollowersDatasourceImpl implements InstaFollowersDatasource {
  final Dio dio;
  late Map<String, dynamic> envVars;
  InstaFollowersDatasourceImpl(this.dio, this.envVars);

  @override
  Future<ResultInstaFollowers> getInstaFollowers() async {
    var response = await dio.get(LinksUrl.instagramFollowersData);

    if (response.statusCode == 200) {
      return ResultInstaFollowersModel(userFollowerNumber: response.data);
    } else {
      throw SendContactExternalError(
          message: "Error no instagram followers found!");
    }
  }
}
