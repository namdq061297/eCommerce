import 'package:flutter/material.dart';
import 'package:t_store/features/authentication/controllers/onboarding/onboarding.controller.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/device/device_utility.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: TDeviceUtils.getAppBarHeight(),
        right: TSizes.defaultSpace,
        child: TextButton(onPressed: () => OnboardingController.instance.skipPage(), child: const Text('Skip')));
  }
}