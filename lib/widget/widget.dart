// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip/widget/controller/widget_controller.dart';

class Custormwidget {
  bool isVaisibility = false;
  Widget formTextField(
      {required String hintText,
      required TextEditingController textcontroller,
      double? size}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
          height: 60,
          width: size ?? Get.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 228, 238, 255)),
          child: TextFormField(
            controller: textcontroller,
            decoration: InputDecoration(
                label: Text(hintText),
                hintText: hintText,
                border: const OutlineInputBorder(borderSide: BorderSide.none)),
          )),
    );
  }

  Widget passwordForTextFeild({
    required String hintText,
    required TextEditingController textcontroller,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 228, 238, 255)),
          child: GetBuilder<WidgetController>(
            init: WidgetController(),
            builder: (controller) {
              return TextFormField(
                obscureText: controller.isVisibillty == true ? false : true,
                controller: textcontroller,
                decoration: InputDecoration(
                    label: Text(hintText),
                    hintText: hintText,
                    suffixIcon: IconButton(
                        onPressed: () {
                          if (controller.isVisibillty == false) {
                            controller.isVisibillty = true;
                          } else {
                            controller.isVisibillty = false;
                          }
                          controller.update();
                        },
                        icon: Icon(
                          !controller.isVisibillty
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: const Color.fromARGB(255, 166, 187, 255),
                        )),
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none)),
              );
            },
          )),
    );
  }

  Widget formTextField2(
      {required String hintText1,
      required String hintText2,
      required TextEditingController textController1,
      required TextEditingController textController2}) {
    return Row(
      children: [
        formTextField(
            hintText: hintText1,
            textcontroller: textController1,
            size: Get.width * 0.44),
        SizedBox(
          width: 10,
        ),
        formTextField(
            hintText: hintText2,
            textcontroller: textController2,
            size: Get.width * 0.45)
      ],
    );
  }
}
