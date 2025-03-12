import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/TSectionHeading.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/TPrimaryHeaderContainer.dart';
import 'package:t_store/common/widgets/layout/gird_layout.dart';
import 'package:t_store/common/widgets/products/product_card_vertical.dart';
import 'package:t_store/features/shop/screens/home/widget/THomeCategories.dart';
import 'package:t_store/features/shop/screens/home/widget/TPromoSlider.dart';
import 'package:t_store/features/shop/screens/home/widget/home_appbar.dart';
import 'package:t_store/features/shop/screens/home/widget/home_search.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  THomeAppBar(),
                  SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TSearchContainer(
                    text: 'Search in Store',
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  THomeCategories()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(
                    autoPlay: true,
                    banners: [
                      TImages.banner1,
                      TImages.banner2,
                      TImages.banner3
                    ],
                  ),
                  TSectionHeading(title: 'Popular product', onPress: (){},),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  TGridLayout(itemCount: 4, itemBuilder: (_, index) => const TProductCardVertical(),)
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
