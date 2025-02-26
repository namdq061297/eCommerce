import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/screens/login/login.screen.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  final pageController = PageController();
  Rx<int> currentIndex = 0.obs;
  // RxInt currentIndex = RxInt(0);

  void updatePageIndicator(index) {
    currentIndex.value = index;
  }

  void dotNavigatePress(index) {
    currentIndex.value = index;
    pageController.animateToPage(index,
        duration: const Duration(microseconds: 2000), curve: Curves.easeIn);
  }

  void nextPage() {
    if (currentIndex.value == 2) {
      // pass
      Get.offAll(const LoginScreen());
    } else {
      int page = currentIndex.value + 1;
      pageController.animateToPage(page,
          duration: const Duration(microseconds: 2000), curve: Curves.easeIn);
    }
  }

  void skipPage() {
    // currentIndex.value = 2;
    // pageController.animateToPage(2,
    //     duration: const Duration(microseconds: 2000), curve: Curves.easeIn);
    Get.offAll(const LoginScreen());
  }
}
