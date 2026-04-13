// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/controllers/password/forget_password.controller.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/validators/validation.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(TTexts.forgetPasswordTitle,
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: TSizes.spaceBtwItems),
                Text(TTexts.forgetPasswordSubTitle,
                    style: Theme.of(context).textTheme.labelMedium),
                const SizedBox(height: TSizes.spaceBtwSections),
                TextFormField(
                  controller: controller.email,
                  validator: TValidator.validateEmail,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_right),
                      labelText: TTexts.email),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.sendPasswordResetEmail(),
                      child: const Text(TTexts.submit)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
