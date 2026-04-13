import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/user/user.repository.dart';
import 'package:t_store/features/personalization/models/user.model.dart';
import 'package:t_store/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  /// Lưu thông tin user vào Firestore sau khi đăng nhập bằng social (Google/Facebook).
  /// Chỉ lưu nếu đây là lần đăng nhập đầu tiên (isNewUser == true).
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
