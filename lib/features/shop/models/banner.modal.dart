import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  final String id;
  String imageUrl = '';
  final bool active;
  final String targetScreen;

   BannerModel({
    required this.id,
    required this.imageUrl,
    required this.active,
    required this.targetScreen,
  });

  /// Empty Model
  static BannerModel empty() => BannerModel(
        id: '',
        imageUrl: '',
        active: false,
        targetScreen: '',
      );

  /// Convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'active': active,
      'targetScreen': targetScreen,
    };
  }

  /// Map JSON to model
  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['Id'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      active: json['active'] ?? false,
      targetScreen: json['targetScreen'] ?? '',
    );
  }

  /// Map Firestore DocumentSnapshot to model
  factory BannerModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data == null) return BannerModel.empty();

    return BannerModel(
      id: document.id,
      imageUrl: data['imageUrl'] ?? '', // chữ thường
      active: data['active'] ?? false, // chữ thường
      targetScreen: data['targetScreen'] ?? '', // chữ thường
    );
  }
}
