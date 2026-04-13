import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/authentication.repository.dart';
import 'package:t_store/features/personalization/controllers/user.controller.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/local_storage/storage_utility.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final _localStorage = TLocalStorage();

  // Form key
  final formKey = GlobalKey<FormState>();

  // Form controllers
  final email = TextEditingController();
  final password = TextEditingController();

  // Observable state
  final isShowPassword = false.obs;
  final rememberMe = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Load saved credentials nếu có
    email.text = _localStorage.readData<String>('REMEMBER_ME_EMAIL') ?? '';
    password.text = _localStorage.readData<String>('REMEMBER_ME_PASSWORD') ?? '';
    rememberMe.value = email.text.isNotEmpty;
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }

  void setHide() => isShowPassword.value = !isShowPassword.value;
  void setRememberMe() => rememberMe.value = !rememberMe.value;

  Future<void> login() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
        'Logging you in...',
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

      // Save or clear credentials theo trạng thái rememberMe
      if (rememberMe.value) {
        await _localStorage.saveData('REMEMBER_ME_EMAIL', email.text.trim());
        await _localStorage.saveData('REMEMBER_ME_PASSWORD', password.text.trim());
      } else {
        await _localStorage.removeData('REMEMBER_ME_EMAIL');
        await _localStorage.removeData('REMEMBER_ME_PASSWORD');
      }

      // Login with Firebase Authentication
      await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Redirect
      TFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      final userCredential = await AuthenticationRepository.instance.signInWithGoogle();

      // Lưu user record nếu là lần đăng nhập đầu tiên
      await UserController.instance.saveUserRecord(userCredential);

      TFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<void> facebookSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      final userCredential = await AuthenticationRepository.instance.signInWithFacebook();

      await UserController.instance.saveUserRecord(userCredential);

      TFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}

