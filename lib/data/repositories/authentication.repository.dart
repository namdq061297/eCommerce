import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/screens/login/login.screen.dart';
import 'package:t_store/features/authentication/screens/onboarding/onboarding.screen.dart';
import 'package:t_store/utils/local_storage/storage_utility.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _localStorage = TLocalStorage();

  @override
  void onReady() {
    super.onReady();
    FlutterNativeSplash.remove();
    _screenRedirect();
  }

  void _screenRedirect() {
    final isFirstTime = _localStorage.readData<bool>('isFirstTime') ?? true;
    print('isFirstTime value from local storage: $isFirstTime');
    if (isFirstTime) {
      _localStorage.saveData('isFirstTime', true);
      Get.offAll(() => const OnboardingScreen());
    } else {
      Get.offAll(() => const LoginScreen());
    }
  }
}
