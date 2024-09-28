import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterando/app/modules/home/domain/entities/result_followers_numbers.dart';
import 'package:flutterando/app/modules/home/domain/usecases/get_follower_numbers.dart';

import '../../../../utils/screen/screen_size.dart';

class HeaderStore extends ValueNotifier<ResultFollowers> {
  final GetFollowersNumbers getFolowersNumbers;
  final ScreenSize screen;
  HeaderStore(this.getFolowersNumbers, this.screen)
      : super(ResultFollowers(
          facebook: '',
          discord: '',
          instagram: '',
          linkedin: '',
          telegram: '',
          twitter: '',
          youtube: '',
        ));

  Future<void> load() async {
    var result = await getFolowersNumbers();

    result.fold((l) {
      print('Ops');
    }, (r) {
      value = r;
    });
  }
}
