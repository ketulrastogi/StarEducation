import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String categoryId;
  String name;
  String iconUrl;

  CategoryModel({
    this.categoryId,
    this.name,
    this.iconUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      // 'categoryId': categoryId,
      'name': name,
      'iconUrl': iconUrl,
    };
  }

  factory CategoryModel.fromFirestore(DocumentSnapshot ds) {
    return CategoryModel(
      categoryId: ds.id,
      name: ds.data()['name'],
      iconUrl: ds.data()['iconUrl'],
    );
  }
}
