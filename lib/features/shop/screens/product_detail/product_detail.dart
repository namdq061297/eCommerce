import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/common/widgets/TSectionHeading.dart';
import 'package:t_store/features/shop/screens/product_detail/widgets/TProductMetaData.dart';
import 'package:t_store/features/shop/screens/product_detail/widgets/TProductSlideImage.dart';
import 'package:t_store/features/shop/screens/product_detail/widgets/TRatingAndShare.dart';
import 'package:t_store/utils/constants/sizes.dart';

import 'controller/product_detail.controller.dart';
import 'widgets/TBottomAddToCart.dart';
import 'widgets/TProductAttributes.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductDetailControler());
    return Scaffold(
      bottomNavigationBar:Obx(
        () => TBottomAddToCart(
        count: controller.count.value.toString(),
        onPressedIncrease: () => controller.increase(),
        onPressedDecrease: () => controller.decrease(),
      )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1 - Product Image Slider
            const TProductImageSlider(),
            Padding(
              padding: const EdgeInsets.only(
                right: TSizes.defaultSpace,
                left: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  /// Rating & Share Button Row
                  const TRatingAndShare(),
                  const TProductMetaData(),
                  const TProductAttributes(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Check out')),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const ReadMoreText(
                    'This is a Product description for Blue Nike Sleeve less vest. There are more things. This is a Product description for Blue Nike Sleeve less vest. There are more things',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const TSectionHeading(
                    title: 'Review (11)',
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            /// 2 - Product Details
          ],
        ),
      ),
    );
  }
}
