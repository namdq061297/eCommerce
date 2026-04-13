import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/personalization/controllers/change_name.controller.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/validators/validation.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangeNameController());

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Change Name', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Use your real name for easy verification. This name will appear on several pages.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            Form(
              key: controller.formKey,
              child: Column(
                children: [
                  /// First Name
                  TextFormField(
                    controller: controller.firstNameController,
                    validator: (v) => TValidator.validateEmptyString(v, 'First Name'),
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                      prefixIcon: Icon(Iconsax.user),
                    ),
                    expands: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),

                  /// Last Name
                  TextFormField(
                    controller: controller.lastNameController,
                    validator: (v) => TValidator.validateEmptyString(v, 'Last Name'),
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                      prefixIcon: Icon(Iconsax.user),
                    ),
                    expands: false,
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Save Button
            SizedBox(
              width: double.infinity,
              child: Obx(
                () => ElevatedButton(
                  onPressed: controller.isLoading.value ? null : controller.updateName,
                  child: controller.isLoading.value
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Save'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
