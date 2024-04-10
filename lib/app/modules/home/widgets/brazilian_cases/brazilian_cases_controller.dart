import 'package:flutter_triple/flutter_triple.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_brazilian_cases.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_brazilian_cases.dart';
import 'package:flutterando/app/utils/screen/screen_size.dart';

class BrazilianCasesController extends Store<List<ResultBrazilianCases>> {
  final ScreenSize screen;
  final GetBrazilianCases usecase;
  BrazilianCasesController(this.screen, this.usecase) : super([]) {
    fetchBrazilianCases();
  }

  Future<void> fetchBrazilianCases() async {
    var response = await usecase();
    response.fold(
      (l) => setError(l),
      (brazilianCases) => update(brazilianCases),
    );
  }
}
