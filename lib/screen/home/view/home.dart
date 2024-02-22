import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trip/screen/home/controller/home_controller.dart';
import 'package:trip/screen/home/view/widget/widget.dart';
import 'package:trip/util/apptext.dart';
import 'package:trip/util/google_map.dart';
import 'package:trip/util/icons/icons.dart';
import 'package:trip/util/text_widget.dart';
import 'package:trip/widget/loading/loading.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locationController =
        Get.put<LocationController>(LocationController());
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.amber,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton.filled(
                child: const Text('Sign out'),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                },
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        actions: [
          Container(
            height: 45,
            width: 45,
            margin: const EdgeInsets.only(right: 10),
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 217, 217, 217)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SvgPicture.asset(
                personSVG,
                height: 15,
                // ignore: deprecated_member_use
                color: Colors.grey,
              ),
            ),
          )
        ],
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(
                    text: currentLoaction,
                    color: const Color.fromARGB(255, 181, 180, 180),
                    size: 15)
                .textFontSize(),
            SizedBox(
              width: 200,
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Color.fromARGB(255, 51, 156, 243),
                  ),
                  Expanded(
                    child: GetBuilder<LocationController>(
                      init: locationController,
                      builder: (controller) => controller.isLoading.value ==
                              true
                          ? shimmerLoading(heigth: 16, width: 200)
                          : TextWidget(text: controller.currentLocal, size: 16)
                              .textFontSize(),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            // HomeWidget().homeAppBar(locationController: locationController),
            // const SizedBox(
            //   height: 30,
            // ),
            HomeWidget().viewAllWidget(text: category),
            const SizedBox(
              height: 20,
            ),
            controller.obx(
              onLoading: HomeWidget().categoryShimmer(),
              (state) => HomeWidget()
                  .categoryList(categorylist: state!, controller: controller),
            ),
            const SizedBox(
              height: 20,
            ),
            controller.obx(
              onLoading: HomeWidget().loadingcard(),
              (state) => HomeWidget().imagecard(controller: controller),
            ),
            const SizedBox(
              height: 20,
            ),
            HomeWidget().viewAllWidget(text: populareDestination),
            const SizedBox(
              height: 10,
            ),
            controller.obx(
                onLoading: HomeWidget().loadingDestination(),
                (state) => HomeWidget()
                    .destinationCard(poulareList: controller.populare))
          ]),
        ),
      ),
    );
  }
}
