import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/controllers/login/login.controller.dart';
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
      child: Obx(() => Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                vertical: TSizes.spaceBtwSections),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_right),
                      labelText: TTexts.email),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),
                TextFormField(
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
                        Checkbox(value: true, onChanged: (val) {}),
                        const Text(TTexts.rememberMe),
                      ],
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(TTexts.forgetPassword))
                  ],
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text(TTexts.signIn)),
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
