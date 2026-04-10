import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/authentication.repository.dart';
import 'package:t_store/data/repositories/user/user.repository.dart';
import 'package:t_store/features/authentication/screens/signup/verifyEmail.screen.dart';
import 'package:t_store/features/personalization/models/user.model.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  // Form key
  final formKey = GlobalKey<FormState>();

  // Form controllers
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();

  // Observable state
  final isShowPassword = false.obs;
  final isCheck = true.obs;

  @override
  void onClose() {
    firstName.dispose();
    lastName.dispose();
    username.dispose();
    email.dispose();
    phoneNumber.dispose();
    password.dispose();
    super.onClose();
  }

  void setHide() => isShowPassword.value = !isShowPassword.value;
  void setCheck() => isCheck.value = !isCheck.value;

  Future<void> signup() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
        'We are processing your information...',
        TImages.docerAnimation,
      );

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!formKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy Check
      if (!isCheck.value) {
        TFullScreenLoader.stopLoading();
        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: 'In order to create account, you must read and accept the Privacy Policy & Terms of Use.',
        );
        return;
      }

      // Register user in Firebase Authentication & Send email verification
      final repo = AuthenticationRepository.instance;
      final UserCredential userCredential =  await repo.registerWithEmailAndPassword(email.text.trim(), password.text.trim());
      await repo.sendEmailVerification();
      final user = userCredential.user;

      // Save user record in Firestore
      if (user != null) {
        final newUser = UserModel(
          id: user.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
        );
        // final userRepo = Get.put(UserRepository());
        // await userRepo.saveUserRecord(newUser);
        await UserRepository.instance.saveUserRecord(newUser);
      }

      // Show Success Message
      TLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your account has been created! Verify email to continue.',
      );

      // Move to Verify Email Screen
      Get.to(() => const VerifyEmailScreen());
    } on FirebaseAuthException catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: TFirebaseAuthException(e.code).message);
    } on FirebaseException catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: TFirebaseException(e.code).message);
    } on PlatformException catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: TPlatformException(e.code).message);
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
