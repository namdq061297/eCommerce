import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/controllers/onboarding/onboarding.controller.dart';
import 'package:t_store/features/authentication/screens/onboarding/widgets/onboarding_next_btn.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/text_strings.dart';

import 'widgets/onboarding_dot.dart';
import 'widgets/onboarding_page.dart';
import 'widgets/onboarding_skip_btn.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: controller.pageController,
          onPageChanged: controller.updatePageIndicator,
          children: const [
            OnboardingPage(
              image: TImages.onBoardingImage1,
              title: TTexts.onBoardingTitle1,
              subtitle: TTexts.onBoardingSubTitle1,
            ),
            OnboardingPage(
              image: TImages.onBoardingImage1,
              title: TTexts.onBoardingTitle1,
              subtitle: TTexts.onBoardingSubTitle1,
            ),
            OnboardingPage(
              image: TImages.onBoardingImage1,
              title: TTexts.onBoardingTitle1,
              subtitle: TTexts.onBoardingSubTitle1,
            )
          ],
        ),
        const SkipButton(),
        const DotButton(),
        const NextButton(),
      ],
    ));
  }
}
