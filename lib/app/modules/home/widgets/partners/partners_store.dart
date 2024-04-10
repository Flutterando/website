import 'package:flutter_triple/flutter_triple.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_partners.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_partners.dart';
import 'package:flutterando/app/utils/screen/screen_size.dart';

class PartnersStore extends Store<List<ResultPartners>> {
  final ScreenSize screen;
  final GetPartners usecase;
  PartnersStore(this.screen, this.usecase) : super([]) {
    fetchPartners();
  }

  fetchPartners() async {
    var response = await usecase.call();
    response.fold(
      (l) => setError(l),
      (r) => update(r),
    );
  }
}
