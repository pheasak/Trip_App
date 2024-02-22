import 'package:get/get.dart';

void routeToNamed(
    {required String routeName,
    dynamic arguments,
    Map<String, String>? parameters,
    Function()? onBack}) async {
  await Get.toNamed(routeName, arguments: arguments, parameters: parameters)!
      .then((value) {
    if (onBack != null) {
      onBack();
    }
  });
}

void routeBack() {
  Get.back();
}

// void routeTo(dynamic page, {Transition? transition}) {
//   Get.to(page, transition: transition);
// }
