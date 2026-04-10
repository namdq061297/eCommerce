import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/screens/login/login.screen.dart';
import 'package:t_store/features/authentication/screens/onboarding/onboarding.screen.dart';
import 'package:t_store/utils/local_storage/storage_utility.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _localStorage = TLocalStorage();
  final _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    _screenRedirect();
  }

  void _screenRedirect() {
    final isFirstTime = _localStorage.readData<bool>('isFirstTime') ?? true;
    if (isFirstTime) {
      _localStorage.saveData('isFirstTime', true);
      Get.offAll(() => const OnboardingScreen());
    } else {
      Get.offAll(() => const LoginScreen());
    }
  }

  /// Đăng ký user bằng email & password, trả về UserCredential
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    return await _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  /// Gửi email verification cho user hiện tại
  Future<void> sendEmailVerification() async {
    await _auth.currentUser?.sendEmailVerification();
  }
}
