import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip/screen/login/controller/authenication.dart';
import 'package:trip/screen/login/methods/method.dart';
import 'package:trip/screen/login/view/registerscreen.dart';
import 'package:trip/util/apptext.dart';
import 'package:trip/util/text_widget.dart';
import 'package:trip/widget/custorm_button.dart';
import 'package:trip/widget/signInType.dart';
import 'package:trip/widget/widget.dart';

class LoginPage extends GetView<AuthenicationController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget(text: getStart).fontwidth800(),
            TextWidget(text: startAccount).fontwidth500(isAlignEnd: false),
            Custormwidget().formTextField(
              hintText: 'Email',
              textcontroller: controller.emailController,
            ),
            Custormwidget().passwordForTextFeild(
              hintText: 'Passwords',
              textcontroller: controller.passwordController,
            ),
            TextWidget(text: forgetPassword).fontwidth500(isAlignEnd: true),
            CustormButton(
              text: login,
              onClicked: () {
                LoginMethods.instance
                    .checkLoginValidate(controller: controller);
              },
            ).cupertinoButton(),
            const Divider(
              thickness: 1,
            ),
            SizedBox(
                width: Get.width,
                child: const Text(
                  'or',
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                )),
            SignInTypeWidget().logoList(),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(dontHaveAccount),
                TextButton(
                  onPressed: () => Get.to(const RegisterScreen()),
                  child: Text(
                    register,
                    style: const TextStyle(color: Colors.blue),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
