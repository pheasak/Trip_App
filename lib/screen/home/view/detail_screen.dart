import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip/screen/home/model/attraction_model.dart';
import 'package:trip/util/custom/custom_imaage.dart';
import 'package:trip/widget/custorm_button.dart';

import '../../../util/text_widget.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data =
        Get.arguments['Attraction'] as AttractionModel; // from home page
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              stretch: true,
              pinned: true,
              actions: [
                likeButton(
                  onProgress: () {},
                )
              ],
              expandedHeight: 400,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                  stretchModes: const [
                    StretchMode.zoomBackground,
                    StretchMode.blurBackground
                  ],
                  background: Hero(
                    tag: data.name!,
                    child: CustomImageWidget()
                        .cachedNetWorkImage(imageUrl: data.image!, border: 0),
                  )),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(10),
                child: Container(
                    width: Get.width,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                    child: const Text('')),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: data.name,
                              size: 17,
                            ).fontwidth600(),
                            TextWidget(
                                    text: data.location,
                                    size: 17,
                                    color: Colors.blue)
                                .addressText()
                          ],
                        ),
                        data.price == 0
                            ? TextWidget(text: 'Free', size: 18).fontwidth800()
                            : Row(
                                children: [
                                  TextWidget(text: '\$${data.price}', size: 18)
                                      .fontwidth800(),
                                  TextWidget(
                                          size: 17,
                                          text: '/Person',
                                          color: Colors.grey)
                                      .textFontSize()
                                ],
                              )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      data.description!,
                      style: const TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(text: 'Preivew', size: 16).fontwidth600(),
                        Container(
                          height: 27,
                          width: 80,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 242, 242, 242),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              TextWidget(
                                      size: 15,
                                      text: '${data.rate}',
                                      color: Colors.grey)
                                  .textFontSize()
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: data.galery!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: CustomImageWidget().cachedNetWorkImage(
                                imageUrl: data.galery![index],
                                height: 150,
                                width: 150),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: DecoratedBox(
        decoration: const BoxDecoration(),
        child: CustormButton(
          text: 'Book',
          onClicked: () {},
        ).cupertinoButton(borderRadius: 10),
      ),
    );
  }
}
