import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:t_store/data/repositories/user/user.repository.dart';
import 'package:t_store/features/personalization/models/user.model.dart';
import 'package:t_store/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  Rx<UserModel?> user = UserModel.empty().obs;
  final userRepository = UserRepository.instance;
  final profileLoading = false.obs;
  final imageUploading = false.obs;

  @override
  void onInit(){
    super.onInit();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      profileLoading.value = true;
      final userData = await userRepository.fetchUserDetails();
      print('userData fetched: ${userData.toJson()}');
      user(userData);
      // Lưu user data vào observable để các widget có thể sử dụng
      // Ví dụ: this.user.value = userData;
    } catch (e) {
      TLoaders.errorSnackBar(
        title: 'Error fetching user data',
        message: e.toString(),
      );
    } finally {
      profileLoading.value = false;
    }
  }

  /// Lưu thông tin user vào Firestore sau khi đăng nhập bằng social (Google/Facebook).
  /// Chỉ lưu nếu đây là lần đăng nhập đầu tiên (isNewUser == true).
  /// Update first name + last name in Firestore and local state
  Future<void> updateName(String firstName, String lastName) async {
    try {
      await userRepository.updateSingleField({
        'FirstName': firstName,
        'LastName': lastName,
      });
      user.update((u) {
        u?.firstName = firstName;
        u?.lastName = lastName;
      });
      Get.back();
      TLoaders.successSnackBar(title: 'Congratulations', message: 'Your name has been updated.');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<void> uploadProfilePicture() async {
    try {
      final picker = ImagePicker();
      final picked = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxWidth: 512,
      );
      if (picked == null) return;

      imageUploading.value = true;
      final uid = user.value?.id ?? '';
      final url = await userRepository.uploadImage(
        'Users/Images/Profile/$uid/ProfilePicture',
        File(picked.path),
      );
      await userRepository.updateSingleField({'ProfilePicture': url});
      user.update((u) => u?.profilePicture = url);
      TLoaders.successSnackBar(title: 'Congratulations', message: 'Your profile picture has been updated.');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      imageUploading.value = false;
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential == null || userCredential.user == null) return;

      // Chỉ lưu lần đầu đăng ký
      if (!(userCredential.additionalUserInfo?.isNewUser ?? false)) return;

      final firebaseUser = userCredential.user!;
      final displayName = firebaseUser.displayName?.trim() ?? '';
      final nameParts = displayName.isEmpty ? <String>[] : displayName.split(' ');

      final newUser = UserModel(
        id: firebaseUser.uid,
        firstName: nameParts.isNotEmpty ? nameParts.first : '',
        lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
        username: displayName.toLowerCase().replaceAll(' ', '_'),
        email: firebaseUser.email ?? '',
        phoneNumber: firebaseUser.phoneNumber ?? '',
        profilePicture: firebaseUser.photoURL ?? '',
      );

      await UserRepository.instance.saveUserRecord(newUser);
    } catch (_) {
      TLoaders.warningSnackBar(
        title: 'Data not saved',
        message:
            'Something went wrong while saving your information. You can re-save your data in your Profile.',
      );
    }
  }
  
}
