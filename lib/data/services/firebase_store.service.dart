import 'dart:typed_data';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';

class TFirebaseStorageService extends GetxController {
  static TFirebaseStorageService get instance => Get.find();

  final _storage = FirebaseStorage.instance;

  /// Upload Local Assets from IDE → return Uint8List
  Future<Uint8List> getImageDataFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      return byteData.buffer.asUint8List(
        byteData.offsetInBytes,
        byteData.lengthInBytes,
      );
    } catch (e) {
      throw 'Error loading image from assets: $e';
    }
  }

  /// Upload Image to Firebase Storage → return Download URL
  Future<String> uploadImageData(
    String path,
    Uint8List imageData,
    String imageName,
  ) async {
    try {
      final ref = _storage.ref(path).child(imageName);
      await ref.putData(imageData, SettableMetadata(contentType: 'image/jpeg'));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } catch (e) {
      throw 'Error uploading image: $e';
    }
  }

  Future<String> uploadImageFile(
    String path,
    XFile image,
  ) async {
    try {
      final ref = _storage.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } catch (e) {
      throw 'Error uploading image: $e';
    }
  }
}