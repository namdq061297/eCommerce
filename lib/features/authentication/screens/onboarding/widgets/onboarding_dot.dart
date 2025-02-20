import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:t_store/features/authentication/controllers/onboarding/onboarding.controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/device/device_utility.dart';

class DotButton extends StatelessWidget {
  const DotButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Positioned(
        bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
        left: TSizes.defaultSpace,
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: (index) => controller.dotNavigatePress(index),
          count: 3,
          effect: const ExpandingDotsEffect(
              activeDotColor: TColors.dark, dotHeight: 6),
        ));
  }
}
