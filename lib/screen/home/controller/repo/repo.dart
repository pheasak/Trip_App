// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trip/screen/home/model/attraction_model.dart';

class HomeRepo {
  Future getCategory() async {
    try {
      final data = await FirebaseFirestore.instance
          .collection('category')
          .get()
          .then((value) => CatagoryModel().fromList(value.docs));
      return data;
    } on FirebaseException catch (e) {
      print(e.toString());
    }
  }

  // Future<List<AttractionModel>> getAttraction(String snapshotId) async {
  //   try {
  //     final attraction = await FirebaseFirestore.instance
  //         .collection('category')
  //         .doc(snapshotId)
  //         .collection('data')
  //         .get()
  //         .then((value) => AttractionModel().fromList(value.docs));
  //     return attraction;
  //   } on FirebaseException catch (e) {
  //     print(e.toString());
  //   }
  //   return [];
  // }

  Future<List<AttractionModel>> getPopulareDestination() async {
    try {
      final populare = await FirebaseFirestore.instance
          .collection('populare')
          .get()
          .then((value) => AttractionModel().fromList(value.docs));
      return populare;
    } catch (e) {
      print(e.toString());
    }
    return [];
  }
}
