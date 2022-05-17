import '../models/result_founders_model.dart';

abstract class FoundersDatasource {
  Future<List<ResultFoundersModel>> getFounders();
}
