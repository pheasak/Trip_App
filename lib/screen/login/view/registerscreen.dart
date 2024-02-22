import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip/screen/login/controller/authenication.dart';
import 'package:trip/screen/login/methods/method.dart';
import 'package:trip/util/apptext.dart';
import 'package:trip/util/text_widget.dart';
import 'package:trip/widget/custorm_button.dart';
import 'package:trip/widget/widget.dart';

class RegisterScreen extends GetView<AuthenicationController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(text: createAccount).fontwidth800(),
            TextWidget(text: 'Lorem Ipsum is simply dummy text ')
                .fontwidth500(isAlignEnd: false),
            Custormwidget().formTextField2(
                hintText1: 'First name',
                hintText2: 'last name',
                textController1: controller.firstController,
                textController2: controller.lastController),
            Custormwidget().formTextField(
                hintText: 'Email', textcontroller: controller.emailController),
            Custormwidget().passwordForTextFeild(
                hintText: 'Password',
                textcontroller: controller.passwordController),
            Custormwidget().passwordForTextFeild(
                hintText: 'Confirm password',
                textcontroller: controller.confirmpassController),
            CustormButton(
              text: register,
              onClicked: () {
                LoginMethods.instance
                    .checkRegisterValidate(controller: controller);
              },
            ).cupertinoButton()
          ],
        ),
      )),
    );
  }
}
