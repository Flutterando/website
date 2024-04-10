import 'package:flutter_triple/flutter_triple.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_co_organizers.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_co_organizers.dart';
import 'package:flutterando/app/utils/screen/screen_size.dart';

class CoOrganizersStore extends Store<List<ResultCoOrganizers>> {
  final GetCoOrganizers usecase;
  final ScreenSize screen;
  CoOrganizersStore(this.screen, this.usecase) : super([]) {
    fetchPartners();
  }

  Future<void> fetchPartners() async {
    var response = await usecase.call();
    response.fold(
      (l) => setError(l),
      (coOrganizers) => update(coOrganizers),
    );
  }
}
