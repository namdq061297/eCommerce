import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:t_store/common/widgets/TCart.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/personalization/controllers/user.controller.dart';
import 'package:t_store/features/shop/screens/cart/cart.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppBar(
      showBackArrow: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TTexts.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.apply(color: TColors.grey)),
          Obx((){
            if (controller.profileLoading.value) {
             //show shimmer loading effect while fetching user data
              return Shimmer.fromColors(
                baseColor: TColors.grey.withOpacity(0.5),
                highlightColor: TColors.grey.withOpacity(0.2),
                child: Container(
                  width: 120,
                  height: 20,
                  color: TColors.grey,
                  margin: const EdgeInsets.only(top: 4),
                ),
              );
            
            } else {
              return Text(controller.user.value?.fullName ?? 'User',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.apply(color: TColors.white));
            }
          })
        ],
      ),
      actions: [
        TCartCounterIcon(
          iconColor: TColors.white,
          onPress: () => Get.to(() => const CartScreen()),
        )
      ],
    );
  }
}
