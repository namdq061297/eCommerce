import 'package:flutter/material.dart';
import 'package:t_store/features/shop/screens/product_detail/widgets/TProductMetaData.dart';
import 'package:t_store/features/shop/screens/product_detail/widgets/TProductSlideImage.dart';
import 'package:t_store/features/shop/screens/product_detail/widgets/TRatingAndShare.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1 - Product Image Slider
            TProductImageSlider(),
            Padding(
              padding: EdgeInsets.only(
                right: TSizes.defaultSpace,
                left: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  /// Rating & Share Button Row
                  TRatingAndShare(),
                  TProductMetaData(),
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
