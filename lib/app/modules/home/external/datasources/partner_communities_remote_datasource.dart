import 'dart:convert';

import 'package:dio/dio.dart';

import '../../domain/entities/result_followers_numbers.dart';
import '../../domain/entities/result_partner_communities.dart';
import '../../infra/datasources/partner_communities_datasource.dart';
import '../mappers/partner_communities_mapper.dart';

class PartnerCommunitiesRemoteDatasource implements PartnerCommunitiesDatasource {
  final Dio dio;
  PartnerCommunitiesRemoteDatasource(this.dio);

  @override
  Future<List<ResultPartnerCommunities>> getPartnerCommunities() async {
    var url = 'https://raw.githubusercontent.com/Flutterando/website/main/data/brazilian_cases_data.json';

    var response = await dio.get(url);

    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.data) as List;
      var listPartnerCommunities = jsonList.map((e) => ResultPartnerCommunitiesMapper.fromMap(e)).toList();
      listPartnerCommunities.shuffle();
      return listPartnerCommunities;
    }

    return <ResultPartnerCommunities>[];
  }

  @override
  Future<ResultFollowers> getFolowers() async {
    var url = 'https://raw.githubusercontent.com/Flutterando/website/main/data/followers_number.json';

    var response = await dio.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.data);
      return ResultFollowers(
        youtube: data['youtube'],
        instagram: data['instagram'],
        twitter: data['twitter'],
        discord: data['discord'],
        telegram: data['telegram'],
        facebook: data['facebook'],
        linkedin: data['linkedin'],
      );
    }

    return ResultFollowers(
      youtube: '',
      instagram: '',
      twitter: '',
      discord: '',
      telegram: '',
      facebook: '',
      linkedin: '',
    );
  }
}
