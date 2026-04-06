import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/TRoundContainer.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/layout/gird_layout.dart';
import 'package:t_store/common/widgets/products/product_card_vertical.dart';
import 'package:t_store/features/shop/controllers/view_all_products_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ViewAllProductsScreen extends StatelessWidget {
  const ViewAllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ViewAllProductsController());
    final isDark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Popular Products'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Products',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              GestureDetector(
                onTap: () async {
                  final selected = await THelperFunctions.showAppBottomSheet<String>(
                    context: context,
                    filterOptions: controller.filterOptions,
                    selectedFilter: controller.selectedFilter.value,
                  );
                  if (selected != null && selected != controller.selectedFilter.value) {
                    controller.updateSelectedFilter(selected);
                  }
                },
                child: TRoundedContainer(
                  padding: const EdgeInsets.symmetric(
                    horizontal: TSizes.sm,
                    vertical: TSizes.xs,
                  ),
                  backgroundColor: isDark ? TColors.darkerGrey : TColors.light,
                  child: Row(
                    children: [
                      const Icon(
                        Iconsax.sort,
                        size: TSizes.iconMd,
                        color: TColors.textPrimary,
                      ),
                      const SizedBox(width: TSizes.xs),
                      Obx(() => Text(
                        controller.selectedFilter.value,
                        style: Theme.of(context).textTheme.bodyMedium,
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          TGridLayout(
            itemCount: 12,
            itemBuilder: (_, index) => const TProductCardVertical(),
          ),
        ],
      ),
    );
  }
}
