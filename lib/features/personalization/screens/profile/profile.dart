import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/TSectionHeading.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/image/TCircularImage.dart';
import 'package:t_store/features/personalization/controllers/user.controller.dart';
import 'package:t_store/features/personalization/screens/profile/change_name.dart';
import 'package:t_store/features/personalization/screens/profile/widget/profile_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void copyToClipboard(String text) {
  Clipboard.setData(ClipboardData(text: text));
}

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final profilePicture = controller.user.value?.profilePicture ?? '';
                      return TCircularImage(
                        image: profilePicture.isNotEmpty ? profilePicture : TImages.user,
                        isNetworkImage: profilePicture.isNotEmpty,
                        width: 80,
                        height: 80,
                        fit: BoxFit.contain,
                      );
                    }),
                    Obx(() => TextButton(
                        onPressed: controller.imageUploading.value
                            ? null
                            : controller.uploadProfilePicture,
                        child: controller.imageUploading.value
                            ? const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              )
                            : const Text('Change Profile Picture'))),
                  ],
                ),
              ),

              /// Details
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TSectionHeading(
                  title: 'Profile Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(
                value: controller.user.value?.fullName ?? 'User',
                onPress: () => Get.to(() => const ChangeName()),
                title: 'Name',
              ),
              TProfileMenu(
                  title: 'Username', value: controller.user.value?.username ?? 'coding_with_t', onPress: () {}),

              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Heading Personal Info
              const TSectionHeading(
                  title: 'Personal Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(
                title: 'User ID',
                value: controller.user.value?.id ?? '',
                onPress: () => copyToClipboard(controller.user.value?.id ?? ''),
                icon: Iconsax.copy,
              ),
              TProfileMenu(
                  title: 'E-mail', value: controller.user.value?.email ?? '', onPress: () {}),
              TProfileMenu(
                  title: 'Phone Number',
                  value: controller.user.value?.phoneNumber ?? '',
                  onPress: () {}),
              TProfileMenu(title: 'Gender', value: 'Male', onPress: () {}),
              TProfileMenu(
                  title: 'Date of Birth',
                  value: '10 Oct, 1994',
                  onPress: () {}),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
