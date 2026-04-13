import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/controllers/login/login.controller.dart';
import 'package:t_store/features/authentication/screens/password/forget_password.dart';
import 'package:t_store/features/authentication/screens/signup/signup.screen.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';


class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.formKey,
      child: Obx(() => Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                vertical: TSizes.spaceBtwSections),
            child: Column(
              children: [
                TextFormField(
                  controller: controller.email,
                  validator: (value) => value == null || value.isEmpty ? 'Please enter your email' : null,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_right),
                      labelText: TTexts.email),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),
                TextFormField(
                    controller: controller.password,
                    validator: (value) => value == null || value.isEmpty ? 'Please enter your password' : null,
                    obscureText: controller.isShowPassword.value,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.password_check),
                        labelText: TTexts.password,
                        suffixIcon: TextButton(
                            onPressed: () => controller.setHide(),
                            child: Icon(controller.isShowPassword.value
                                ? Iconsax.eye
                                : Iconsax.eye_slash)))),
                const SizedBox(
                  height: TSizes.spaceBtwInputFields / 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                            value: controller.rememberMe.value,
                            onChanged: (val) => controller.rememberMe.value = val ?? false),
                        const Text(TTexts.rememberMe),
                      ],
                    ),
                    TextButton(
                        onPressed: () => Get.to(() => const ForgetPassword()),
                        child: const Text(TTexts.forgetPassword))
                  ],
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.login(),
                      child: const Text(TTexts.signIn)),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () => Get.to(() => const SignUpScreen()),
                      child: const Text(TTexts.createAccount)),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
              ],
            ),
          )),
    );
  }
}
