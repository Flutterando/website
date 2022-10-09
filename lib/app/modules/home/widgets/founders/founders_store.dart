import 'package:flutter_triple/flutter_triple.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_founders.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_founders.dart';
import 'package:flutterando/app/utils/screen/screen_size.dart';

import '../../domain/errors/errors.dart';

class FoundersStore extends StreamStore<FailureGetFounders, List<ResultFounders>> {
  final GetFounders usecase;

  final ScreenSize screen;
  FoundersStore(this.screen, this.usecase) : super([]) {
    fetchPartners();
  }

  Future<void> fetchPartners() async {
    var response = await usecase.call();
    response.fold(
      (l) => setError(l),
      (founders) => update(founders),
    );
  }
}
