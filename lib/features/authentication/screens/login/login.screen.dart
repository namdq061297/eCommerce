// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:t_store/common/styles/spacing_style.dart';
import 'package:t_store/common/widgets/TFormDivider.dart';
import 'package:t_store/common/widgets/TSocialButton.dart';
import 'package:t_store/features/authentication/screens/login/widgets/TLoginForm.dart';
import 'package:t_store/features/authentication/screens/login/widgets/TLoginHeader.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              TLoginHeader(dark: dark),
              TLoginForm(),
              TFormDivider(dark: dark, text: TTexts.orSignInWith,),
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


