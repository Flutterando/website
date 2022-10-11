import 'package:flutterando/app/modules/home/domain/entities/result_founders.dart';

abstract class FoundersDatasource {
  Future<List<ResultFounders>> getFounders();
}
