import 'package:get/get.dart';
import 'package:trip/screen/home/view/home_main.dart';

import 'package:trip/screen/login/controller/authenication.dart';
import 'package:trip/util/apptext.dart';
import 'package:trip/widget/loading/loading.dart';
import 'package:trip/widget/method/method.dart';
import 'package:trip/widget/show_message.dart';

class LoginMethods {
  LoginMethods._();
  static final instance = LoginMethods._();
  factory LoginMethods() => instance;

  Future checkRegisterValidate(
      {required AuthenicationController controller}) async {
    if (controller.firstController.text.trim().isEmpty) {
      ShowMessage().showMessageSnackbar(message: firstNameIsEmpty);
    } else if (controller.lastController.text.trim().isEmpty) {
      ShowMessage().showMessageSnackbar(message: lastNameIsEmpty);
    } else if (controller.emailController.text.trim().isEmpty) {
      ShowMessage().showMessageSnackbar(message: emailIsEmpty);
    } else if (controller.passwordController.text.trim().isEmpty) {
      ShowMessage().showMessageSnackbar(message: passwordIsEmpty);
    } else if (controller.passwordController.text.trim().length < 6) {
      ShowMessage().showMessageSnackbar(message: errorPassword);
    } else if (!Methods.instance
        .validateEmail(controller.emailController.text.trim())) {
      ShowMessage().showMessageSnackbar(message: errorEmail);
    } else if (controller.passwordController.text !=
        controller.confirmpassController.text) {
      ShowMessage().showMessageSnackbar(message: inCorrectPassword);
    } else {
      openLoading();
      await AuthenicationController()
          .signUpEmailPasswords(
              emailAddress: controller.emailController.text.trim(),
              password: controller.passwordController.text.trim())
          .then((value) {
        if (value == true) {
          closeLoading();
          ShowMessage().showMessageSnackbar(message: signUpSuccess);
          // Get.offAll(() => const HomeScreen());
        }
      });
    }
  }

  Future checkLoginValidate(
      {required AuthenicationController controller}) async {
    if (controller.emailController.text.trim().isEmpty) {
      ShowMessage().showMessageSnackbar(message: emailIsEmpty);
    } else if (controller.passwordController.text.trim().isEmpty) {
      ShowMessage().showMessageSnackbar(message: passwordIsEmpty);
    } else if (controller.passwordController.text.trim().length < 6) {
      ShowMessage().showMessageSnackbar(message: errorPassword);
    } else if (!Methods.instance
        .validateEmail(controller.emailController.text.trim())) {
      ShowMessage().showMessageSnackbar(message: errorEmail);
    } else {
      openLoading();
      await AuthenicationController()
          .signInEmailPasswords(
              emailAddress: controller.emailController.text.trim(),
              password: controller.passwordController.text.trim())
          .then((value) {
        if (value == true) {
          closeLoading();
          ShowMessage().showMessageSnackbar(message: loginSuccess);
          // Get.offAll(() => const HomeScreen());
        }
      });
    }
  }

  void signInType({required int index}) async {
    switch (index) {
      case 0:
        await AuthenicationController().signInWithGoogelAccount().then((value) {
          if (value.user!.email!.isNotEmpty) {
            Get.offAll(() => const MainScreen());
          }
        });
        break;
      case 1:
        await AuthenicationController().signInWithFacebook();
        break;
      default:
    }
  }
}
