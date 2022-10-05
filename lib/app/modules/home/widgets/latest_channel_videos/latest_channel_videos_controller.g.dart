// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_channel_videos_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LatestChannelVideosController
    on _LatestChannelVideosControllerBase, Store {
  late final _$youtubeAtom = Atom(
      name: '_LatestChannelVideosControllerBase.youtube', context: context);

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

  late final _$errorAtom =
      Atom(name: '_LatestChannelVideosControllerBase.error', context: context);

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

  late final _$fetchYoutubeAsyncAction = AsyncAction(
      '_LatestChannelVideosControllerBase.fetchYoutube',
      context: context);

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
