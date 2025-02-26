import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/controllers/signup/signup.controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({
    super.key,
    required this.controller,
    required this.dark,
  });

  final SignUpController controller;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Obx(
        () => Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: TTexts.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                )),
                const SizedBox(width: TSizes.spaceBtwInputFields),
                Expanded(
                    child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ))
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            TextFormField(
              expands: false,
              decoration: const InputDecoration(
                labelText: TTexts.username,
                prefixIcon: Icon(Iconsax.user_edit),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            TextFormField(
              expands: false,
              decoration: const InputDecoration(
                labelText: TTexts.email,
                prefixIcon: Icon(Iconsax.direct),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            TextFormField(
              expands: false,
              decoration: const InputDecoration(
                labelText: TTexts.phoneNo,
                prefixIcon: Icon(Iconsax.call),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            TextFormField(
              obscureText: controller.isShowPassword.value,
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.password_check),
                labelText: TTexts.password,
                suffixIcon: TextButton(
                  onPressed: () => controller.setHide(),
                  child: Icon(controller.isShowPassword.value
                      ? Iconsax.eye
                      : Iconsax.eye_slash),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            Row(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Checkbox(
                      value: controller.isCheck.value,
                      onChanged: (val) => controller.setCheck()),
                ),
                const SizedBox(width: TSizes.sm),
                Flexible(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: TTexts.iAgreeTo,
                            style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(
                            text: ' ${TTexts.privacyPolicy} ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.apply(
                                    color: dark ? TColors.white : TColors.dark,
                                    decoration: TextDecoration.underline,
                                    decorationColor: dark
                                        ? TColors.white
                                        : TColors.primary)),
                        TextSpan(
                            text: TTexts.and,
                            style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(
                            text: ' ${TTexts.termsOfUse} ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.apply(
                                    color: dark ? TColors.white : TColors.dark,
                                    decoration: TextDecoration.underline,
                                    decorationColor: dark
                                        ? TColors.white
                                        : TColors.primary)),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => {},
                  child: const Text(TTexts.createAccount)),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
          ],
        ),
      ),
    );
  }
}
