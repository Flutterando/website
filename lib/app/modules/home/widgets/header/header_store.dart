import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_folowers_numbers.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_folower_numbers.dart';

import '../../../../utils/screen/screen_size.dart';

class HeaderStore extends ValueNotifier<ResultFolowers> {
  final GetFolowersNumbers getFolowersNumbers;
  final ScreenSize screen;
  HeaderStore(this.getFolowersNumbers, this.screen) : super(ResultFolowers("", "", "", "", "", "", ""));

  Future<void> load() async {
    var result = await getFolowersNumbers();

    result.fold((l) {
      print('Ops');
    }, (r) {
      value = r;
    });
  }
}
