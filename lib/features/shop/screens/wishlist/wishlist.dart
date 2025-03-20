import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/TCircularIcon.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/layout/gird_layout.dart';
import 'package:t_store/common/widgets/products/product_card_vertical.dart';
import 'package:t_store/features/authentication/controllers/navigation/navigation.controller.dart';
import 'package:t_store/utils/constants/sizes.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'WishList',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => controller.selectedIndex.value = 0,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace), child: Column(
          children: [
            TGridLayout(itemCount: 12, itemBuilder: (_, index) => const TProductCardVertical())
          ],
        ),),
        
      )
    );
  }
}
