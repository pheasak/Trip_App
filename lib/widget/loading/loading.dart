import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

Center cicularProgressIndecate() {
  return const Center(
      child: CircularProgressIndicator(
    backgroundColor: Colors.transparent,
  ));
}

Future<void> openLoading() async {
  await Future.delayed(
    Duration.zero,
    () => Get.dialog(cicularProgressIndecate(), barrierDismissible: false),
  );
}

void closeLoading() => Get.close(0.toInt());
Widget shimmerLoading({required double heigth, required double width}) {
  return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 198, 198, 198),
      highlightColor: const Color.fromARGB(255, 219, 219, 219),
      child: Container(
        height: heigth,
        width: width,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
      ));
}
