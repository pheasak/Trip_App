// ignore_for_file: deprecated_member_use
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trip/navigation/go_route.dart';
import 'package:trip/navigation/rout_name.dart';
import 'package:trip/screen/home/controller/home_controller.dart';
import 'package:trip/screen/home/model/attraction_model.dart';
import 'package:trip/util/apptext.dart';
import 'package:trip/util/custom/custom_imaage.dart';
import 'package:trip/util/google_map.dart';
import 'package:trip/util/icons/icons.dart';
import 'package:trip/util/text_widget.dart';
import 'package:trip/widget/loading/loading.dart';

class HomeWidget {
  Widget homeAppBar({required LocationController locationController}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 238, 238, 238)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Drawer(
                    width: 200,
                    backgroundColor: Colors.amber,
                    child: Container(
                      color: Colors.amber,
                    ),
                  );
                },
                child: SvgPicture.asset(
                  menuSVG,
                  height: 25,
                  color: Colors.grey,
                ),
              ),
            )),
        Column(
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
        Container(
          height: 45,
          width: 45,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 217, 217, 217)),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SvgPicture.asset(
              personSVG,
              height: 15,
              color: Colors.grey,
            ),
          ),
        )
      ],
    );
  }

  Widget viewAllWidget({required String text}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget(text: text, size: 20).fontwidth600(),
        Row(
          children: [
            TextWidget(text: viewAll, color: Colors.blue, size: 15)
                .textFontSize(),
            const Icon(
              Icons.arrow_forward,
              color: Colors.blue,
              size: 20,
            )
          ],
        )
      ],
    );
  }

  Widget categoryList(
      {required List<CatagoryModel> categorylist, HomeController? controller}) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categorylist.length,
        itemBuilder: (context, index) {
          var data = categorylist[index];
          return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Obx(
                () => GestureDetector(
                  onTap: () {
                    controller.snapshotId = categorylist[index].snapshotId;
                    controller.update();
                    controller.selectedIndex.value = index;
                    print(categorylist[index].snapshotId);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 45,
                    //width: 110,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: controller!.selectedIndex.value == index
                            ? const Color.fromARGB(255, 150, 209, 255)
                            : const Color.fromARGB(255, 238, 238, 238)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextWidget(
                              text: data.name,
                              color: controller.selectedIndex.value == index
                                  ? Colors.white
                                  : Colors.grey,
                              size: 12)
                          .textFontSize(),
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }

  Widget categoryShimmer() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return SizedBox(
            width: 60,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: shimmerLoading(heigth: 40, width: 60),
            ),
          );
        },
      ),
    );
  }

  Widget imagecard({required HomeController controller}) {
    return SizedBox(
        height: 160,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('category')
              .doc(controller.snapshotId!)
              .collection('data')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return loadingcard();
            }

            List<AttractionModel> attractionlist =
                AttractionModel().fromList(snapshot.data!.docs);
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: attractionlist.length,
              itemBuilder: (context, index) {
                // final data = snapshot.data!.docs[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () {
                      routeToNamed(
                          routeName: RouteName().detailScreen,
                          arguments: {'Attraction': attractionlist[index]});
                    },
                    child: SizedBox(
                      height: 160,
                      width: 260,
                      child: Stack(
                        children: [
                          Hero(
                            tag: attractionlist[index].name!,
                            child: CustomImageWidget().cachedNetWorkImage(
                                imageUrl: attractionlist[index].image!),
                          ),
                          Positioned(
                              bottom: 0,
                              child: Container(
                                height: 55,
                                width: 260,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.15)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                                  text: attractionlist[index]
                                                      .name,
                                                  size: 15,
                                                  color: Colors.white)
                                              .fontwidth500(isAlignEnd: false),
                                          TextWidget(
                                                  text: attractionlist[index]
                                                      .location,
                                                  size: 12,
                                                  color: Colors.white)
                                              .addressText()
                                        ],
                                      ),
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            attractionlist[index].price == 0
                                                ? TextWidget(
                                                        text: 'Free',
                                                        size: 15,
                                                        color: Colors.white)
                                                    .fontwidth600()
                                                : TextWidget(
                                                        text:
                                                            '${attractionlist[index].price}\$',
                                                        size: 15,
                                                        color: Colors.white)
                                                    .fontwidth500(
                                                        isAlignEnd: false),
                                            TextWidget(
                                                    text: '/Person',
                                                    size: 12,
                                                    color: Colors.white)
                                                .textFontSize()
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ));
  }

  // shimmer
  Widget loadingcard() {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: shimmerLoading(heigth: 160, width: 260),
          );
        },
      ),
    );
  }

  Widget destinationCard({required List<AttractionModel> poulareList}) {
    return Column(
      children: List.generate(
        poulareList.length,
        (index) => Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: GestureDetector(
            onTap: () {
              routeToNamed(
                  routeName: RouteName().detailScreen,
                  arguments: {'Attraction': poulareList[index]});
            },
            child: DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Hero(
                      tag: poulareList[index].name!,
                      child: CustomImageWidget().cachedNetWorkImage(
                          imageUrl: poulareList[index].image!,
                          height: 110,
                          width: 110),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: poulareList[index].name,
                            size: 17,
                          ).fontwidth600(),
                          const SizedBox(
                            height: 5,
                          ),
                          TextWidget(
                                  text: poulareList[index].location,
                                  color: Colors.blue)
                              .addressText(),
                          const SizedBox(
                            height: 5,
                          ),
                          TextWidget(
                                  maxline: 2,
                                  text: poulareList[index].description,
                                  color: Colors.grey)
                              .textFontSize(),
                          const SizedBox(
                            height: 5,
                          ),
                          poulareList[index].price == 0
                              ? TextWidget(
                                      text: 'Free', size: 18, color: Colors.red)
                                  .fontwidth600()
                              : Row(
                                  children: [
                                    TextWidget(
                                            text:
                                                '\$${poulareList[index].price}',
                                            size: 18)
                                        .fontwidth800(),
                                    TextWidget(
                                            text: '/Person', color: Colors.grey)
                                        .textFontSize()
                                  ],
                                )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget loadingDestination() {
    return SizedBox(
      height: Get.height,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    shimmerLoading(heigth: 110, width: 110),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          shimmerLoading(heigth: 15, width: 150),
                          const SizedBox(
                            height: 5,
                          ),
                          shimmerLoading(heigth: 15, width: 120),
                          const SizedBox(
                            height: 5,
                          ),
                          shimmerLoading(heigth: 15, width: Get.width),
                          const SizedBox(
                            height: 5,
                          ),
                          shimmerLoading(heigth: 15, width: Get.width),
                          const SizedBox(
                            height: 5,
                          ),
                          shimmerLoading(heigth: 15, width: 80),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
