import 'package:flutter/cupertino.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_folowers_numbers.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_folower_numbers.dart';

class HeaderStore extends ValueNotifier<ResultFolowers> {
  final GetFolowersNumbers getFolowersNumbers;
  HeaderStore(this.getFolowersNumbers) : super(ResultFolowers("", "", "", "", "", ""));

  Future<void> load() async {
    var result = await getFolowersNumbers();

    result.fold((l) {
      print('Ops');
    }, (r) {
      value = r;
    });
  }
}
