import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip/util/apptext.dart';

class ShowMessage {
  void showMessageSnackbar({required String message}) {
    Get.showSnackbar(GetSnackBar(
      margin: const EdgeInsets.all(8),
      borderRadius: 15,
      barBlur: 50,
      // forwardAnimationCurve: Curves.easeIn,
      backgroundColor: Color.fromARGB(255, 162, 162, 162),
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
      message: message,
      title: nameApp,
    ));
  }
}
