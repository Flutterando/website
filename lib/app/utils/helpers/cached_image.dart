import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

CachedNetworkImageProvider showImageProvider(String image) {
  return CachedNetworkImageProvider(image);
}

CachedNetworkImage showImage(
  String image, {
  double height = 40.0,
  double width = double.infinity,
  BoxFit boxFit = BoxFit.cover,
  double borderRadius = 0,
  Widget? progressIndicator,
  Color? bgErrorWidget,
  Widget? errorWidget,
}) {
  return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) => Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              image: DecorationImage(
                image: imageProvider,
                fit: boxFit,
              ),
            ),
          ),
      placeholder: (context, url) => Center(
            child: progressIndicator != null
                ? progressIndicator
                : CircularProgressIndicator(),
          ),
      errorWidget: (context, url, error) => Container(
            color: bgErrorWidget,
            child: errorWidget != null ? errorWidget : Icon(Icons.error),
          ));
}

Widget showImageAssets(
  String image, {
  double height = 40.0,
  double width = double.infinity,
  BoxFit boxFit = BoxFit.cover,
  double borderRadius = 0,
}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius),
      image: DecorationImage(
        image: AssetImage("assets/img/" + image),
        fit: boxFit,
      ),
    ),
  );
}