// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/TFormDivider.dart';
import 'package:t_store/common/widgets/TSocialButton.dart';
import 'package:t_store/features/authentication/controllers/signup/signup.controller.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import 'widget/tsignup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(SignUpController());

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Text(TTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: TSizes.spaceBtwSections),
              TSignUpForm(controller: controller, dark: dark),
              TFormDivider(
                dark: dark,
                text: TTexts.orSignInWith,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TSocialButton()
            ],
          ),
        ),
      ),
    );
  }
}

