import 'package:cloud_firestore/cloud_firestore.dart';

class CatagoryModel {
  int? id;
  String? name;
  String? snapshotId;
  List<AttractionModel>? attraction;
  CatagoryModel({this.id, this.attraction, this.name, this.snapshotId});
  List<CatagoryModel> fromList(
          List<DocumentSnapshot<Map<String, dynamic>>> json) =>
      List<CatagoryModel>.from(json.map((e) => CatagoryModel.fromMap(e)))
          .toList();
  factory CatagoryModel.fromMap(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    return CatagoryModel(
        id: data!['id'], name: data['name'], snapshotId: snapshot.id
        // attraction: AttractionModel().fromList(attraction),
        );
  }
}

class AttractionModel {
  int? id;
  String? name;
  double? price;
  double? rate;
  String? image;
  String? description;
  String? location;
  List? galery;
  AttractionModel(
      {this.id,
      this.name,
      this.price,
      this.rate,
      this.description,
      this.galery,
      this.image,
      this.location});
  List<AttractionModel> fromList(
          List<DocumentSnapshot<Map<String, dynamic>>> json) =>
      List<AttractionModel>.from(json.map((e) => AttractionModel.fromMap(e)))
          .toList();
  factory AttractionModel.fromMap(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    return AttractionModel(
        id: data!['id'],
        description: data['description'],
        galery: data['gallery'],
        image: data['image'],
        price: double.parse(data['price']),
        location: data['location'],
        name: data['name'],
        rate: double.parse(data['rate']));
  }
}
