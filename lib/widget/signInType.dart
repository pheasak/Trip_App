// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:trip/screen/login/methods/method.dart';
import 'package:trip/util/logo.dart';

class SignInTypeWidget {
  Widget logoList() {
    return Column(
      children: List.generate(
          logo.length,
          (index) => signInCard(
              index: index,
              logo: logo[index]['logo'],
              label: logo[index]['label'])),
    );
  }

  Widget signInCard(
      {required String logo, required String label, required int index}) {
    return Card(
      child: InkWell(
        onTap: () => LoginMethods.instance.signInType(index: index),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: ListTile(
            leading: SizedBox(
                width: 90,
                child: Image.asset(
                  logo,
                )),
            title: Text(
              label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
          ),
        ),
      ),
    );
  }
}
