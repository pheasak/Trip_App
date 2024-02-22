import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trip/screen/home/controller/home_controller.dart';
import 'package:trip/screen/home/view/home.dart';
import 'package:trip/util/icons/icons.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser;
    final controller = Get.put(HomeController());
    List<Widget> listScreen = [
      const HomeScreen(),
      Container(
        color: Colors.amber,
      ),
      Container(
        color: Colors.blue,
      ),
      Container(
        color: Colors.red,
      )
    ];
    // final locationController =
    //     Get.put<LocationController>(LocationController());
    return SafeArea(
      child: Scaffold(
        // drawer: Drawer(
        //   child: Container(
        //     color: Colors.amber,
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         CupertinoButton.filled(
        //           child: const Text('Sign out'),
        //           onPressed: () async {
        //             await FirebaseAuth.instance.signOut();
        //           },
        //         )
        //       ],
        //     ),
        //   ),
        // ),
        // appBar: AppBar(
        //   centerTitle: true,
        //   actions: [
        //     Container(
        //       height: 45,
        //       width: 45,
        //       margin: EdgeInsets.only(right: 10),
        //       decoration: const BoxDecoration(
        //           shape: BoxShape.circle,
        //           color: Color.fromARGB(255, 217, 217, 217)),
        //       child: Padding(
        //         padding: const EdgeInsets.all(15.0),
        //         child: SvgPicture.asset(
        //           personSVG,
        //           height: 15,
        //           // ignore: deprecated_member_use
        //           color: Colors.grey,
        //         ),
        //       ),
        //     )
        //   ],
        //   title: Column(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       TextWidget(
        //               text: currentLoaction,
        //               color: const Color.fromARGB(255, 181, 180, 180),
        //               size: 15)
        //           .textFontSize(),
        //       SizedBox(
        //         width: 200,
        //         child: Row(
        //           children: [
        //             const Icon(
        //               Icons.location_on,
        //               color: Color.fromARGB(255, 51, 156, 243),
        //             ),
        //             Expanded(
        //               child: GetBuilder<LocationController>(
        //                 init: locationController,
        //                 builder: (controller) =>
        //                     controller.isLoading.value == true
        //                         ? shimmerLoading(heigth: 16, width: 200)
        //                         : TextWidget(
        //                                 text: controller.currentLocal, size: 16)
        //                             .textFontSize(),
        //               ),
        //             )
        //           ],
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        backgroundColor: const Color.fromARGB(255, 248, 244, 244),
        body: Obx(() => listScreen[controller.onTap.value]),
        bottomNavigationBar: Container(
          height: 70,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              iconSvgList.length,
              (index) => GestureDetector(
                onTap: () {
                  controller.onTap(index);
                },
                child: Obx(
                  () => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 30,
                          child: SvgPicture.asset(
                            iconSvgList[index],
                            // ignore: deprecated_member_use
                            color: controller.onTap.value == index
                                ? Colors.blue
                                : null,
                          )),
                      Container(
                        height: 4,
                        width: 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: controller.onTap.value == index
                              ? Colors.blue
                              : null,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
