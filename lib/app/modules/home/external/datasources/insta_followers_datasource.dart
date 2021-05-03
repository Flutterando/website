import 'package:dio/dio.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_insta_followers.dart';
import 'package:flutterando/app/modules/home/domain/errors/get_insta_followers_error.dart';
import 'package:flutterando/app/modules/home/infra/datasources/insta_followers_datasource.dart';
import 'package:flutterando/app/modules/home/infra/models/result_insta_followers_model.dart';
import 'package:flutterando/app/utils/url_launcher/urls.dart';

class InstaFollowersDatasourceImpl implements InstaFollowersDatasource {
  // final HttpService _httpService;
  final Dio _dio;
  InstaFollowersDatasourceImpl(this._dio);

  @override
  Future<ResultInstaFollowers> getInstaFollowers() async {
    var response = await _dio.get(LinksUrl.instagramFollowersData);

    if (response.statusCode == 200) {
      return ResultInstaFollowersModel.fromMap(response.data);
    } else {
      throw GetInstaFollowersError(
        message: "Error no instagram followers found!",
      );
    }
  }
}
