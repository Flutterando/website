import 'dart:convert';

import 'package:dio/dio.dart';

import '../../domain/entities/result_partners_communities.dart';
import '../../infra/datasources/partners_communities_datasource.dart';
import '../mappers/result_partners_communities_mapper.dart';

class PartnersCommunitiesRemoteDatasource implements PartnersCommunitiesDatasource {
  final Dio dio;
  PartnersCommunitiesRemoteDatasource(this.dio);
  @override
  Future<List<ResultPartnersCommunities>> getPartnersCommunities() async {
    var url =
        'https://raw.githubusercontent.com/Flutterando/website/main/data/partners_communities_data.json';
    var response = await dio.get(url);

    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.data) as List;
      var listPartnersCommunities = jsonList
          .map((e) => ResultPartnersCommunitiesMapper.fromMap(e))
          .toList();
      listPartnersCommunities.shuffle();
      return listPartnersCommunities;
    }

    return <ResultPartnersCommunities>[];
  }
}
