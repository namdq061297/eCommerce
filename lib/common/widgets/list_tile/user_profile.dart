import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/image/TCircularImage.dart';
import 'package:t_store/features/personalization/controllers/user.controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({super.key, required this.onTap});

  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return ListTile(
      leading: const TCircularImage(
        image: TImages.user,
        width: 50,
        height: 50,
        padding: 0,
        overLayColor: TColors.white,
      ),
      title: Obx(() {
        return Text(
          controller.user.value?.fullName ?? 'User',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: TColors.white),
        );
      }),
      subtitle:  Obx(() {
        return Text(
          controller.user.value?.email ?? '',
          style:
              Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
        );
      }),
      trailing: IconButton(
        onPressed: onTap,
        icon: const Icon(Iconsax.edit, color: TColors.white),
      ),
    );
  }
}
