import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trip/widget/loading/loading.dart';

class CustomImageWidget {
  Widget cachedNetWorkImage(
      {required String imageUrl,
      double? height,
      double? width,
      double? border}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(border ?? 10),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: height ?? 160,
        width: width ?? 260,
        fit: BoxFit.cover,
        placeholder: (context, url) =>
            shimmerLoading(heigth: height ?? 160, width: width ?? 260),
      ),
    );
  }
}
