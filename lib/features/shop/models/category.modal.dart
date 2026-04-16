import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String id;
  String image = '';
  final bool isFeatured;
  final String name;
  final String? parentId;

   CategoryModel({
    required this.id,
    required this.image,
    required this.isFeatured,
    required this.name,
    this.parentId,
  });

  /// Empty Model
  static CategoryModel empty() => CategoryModel(
        id: '',
        image: '',
        isFeatured: false,
        name: '',
      );

  /// Convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'isFeatured': isFeatured,
      'name': name,
      'parentId': parentId ?? '',
    };
  }

  /// Map JSON to model
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['Id'] ?? '',
      image: json['Image'] ?? '',
      isFeatured: json['IsFeatured'] ?? false,
      name: json['Name'] ?? '',
      parentId: json['ParentId'],
    );
  }

  /// Map Firestore DocumentSnapshot to model
  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data == null) return CategoryModel.empty();

    return CategoryModel(
      id: document.id,
      image: data['image'] ?? '', // chữ thường
      isFeatured: data['isFeatured'] ?? false, // chữ thường
      name: data['name'] ?? '', // chữ thường
      parentId: data['parentId'], // chữ thường
    );
  }
}
