// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_channel_videos_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $LatestChannelVideosController = BindInject(
  (i) => LatestChannelVideosController(
      i<GetYoutube>(), i<ScreenSize>(), i<UrlLauncher>()),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LatestChannelVideosController
    on _LatestChannelVideosControllerBase, Store {
  final _$youtubeAtom =
      Atom(name: '_LatestChannelVideosControllerBase.youtube');

  @override
  ObservableList<ResultYoutube> get youtube {
    _$youtubeAtom.reportRead();
    return super.youtube;
  }

  @override
  set youtube(ObservableList<ResultYoutube> value) {
    _$youtubeAtom.reportWrite(value, super.youtube, () {
      super.youtube = value;
    });
  }

  final _$errorAtom = Atom(name: '_LatestChannelVideosControllerBase.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$fetchYoutubeAsyncAction =
      AsyncAction('_LatestChannelVideosControllerBase.fetchYoutube');

  @override
  Future fetchYoutube() {
    return _$fetchYoutubeAsyncAction.run(() => super.fetchYoutube());
  }

  @override
  String toString() {
    return '''
youtube: ${youtube},
error: ${error}
    ''';
  }
}
