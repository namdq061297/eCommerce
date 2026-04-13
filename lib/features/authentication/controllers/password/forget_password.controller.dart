import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/authentication.repository.dart';
import 'package:t_store/features/authentication/screens/password/reset_password.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();

  @override
  void onClose() {
    email.dispose();
    super.onClose();
  }

  Future<void> sendPasswordResetEmail() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing your request...', TImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!formKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(
        title: 'Email Sent',
        message: 'Email link sent to reset your password.'.tr,
      );

      Get.off(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<void> resendPasswordResetEmail(String email) async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing your request...', TImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(
        title: 'Email Sent',
        message: 'Email link sent to reset your password.'.tr,
      );
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
