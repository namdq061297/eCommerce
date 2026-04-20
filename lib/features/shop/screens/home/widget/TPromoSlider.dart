import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/TCircularContainer.dart';
import 'package:t_store/common/widgets/image/TRoundedImage.dart';
import 'package:t_store/features/shop/controllers/banner.controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
    this.autoPlay = false,
  });
  // final List<String> banners;
  final bool? autoPlay;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());

    return Column(
      children: [
        CarouselSlider(
          // carouselController: controller.buttonCarouselController,
          options: CarouselOptions(
              viewportFraction: 1,
              autoPlay: (autoPlay ?? false),
              onPageChanged: (index, _) =>
                  controller.onPressDotNavigator(index)),
          items: controller.allBanners
              .map((banner) => TRoundedImage(
                  imageUrl: banner.imageUrl,
                  onPress: () => Get.toNamed(banner.targetScreen),
                  borderRadius: TSizes.borderRadiusMd))
              .toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int i = 0; i < controller.allBanners.length; i++)
              Obx(
                () => GestureDetector(
                  onTap: () => controller.onPressDotNavigator(i),
                  child: TCircularContainer(
                    width: 20,
                    height: 4,
                    margin: const EdgeInsets.only(right: 10),
                    bgColor: controller.carouselCurrentIndex.value == i
                        ? TColors.primary
                        : TColors.accent,
                  ),
                ),
              )
          ],
        )
      ],
    );
  }
}
