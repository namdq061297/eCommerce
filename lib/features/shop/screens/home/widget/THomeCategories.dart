import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:t_store/common/widgets/TSectionHeading.dart';
import 'package:t_store/common/widgets/TVerticalImageText.dart';
import 'package:t_store/features/shop/screens/sport/sport.dart';
import 'package:t_store/features/shop/controllers/category.controller.dart';
// import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());

    return Padding(
      padding: const EdgeInsets.only(left: TSizes.defaultSpace),
      child: Column(
        children: [
          const TSectionHeading(
            title: 'Popular Categories',
            buttonTitle: '',
            showActionButton: true,
            textColor: Colors.white,
          ),
          SizedBox(
            height: 80,
            child: Obx(() {
              /// Loading State → Shimmer
              if (controller.isLoading.value) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, __) => _CategoryShimmer(),
                );
              }

              /// Empty State → Data Not Found
              if (controller.featuredCategories.isEmpty) {
                return const Center(
                  child: Text(
                    'Data Not Found',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }

              /// Data State → Show Categories
              return ListView.builder(
                shrinkWrap: true,
                itemCount: controller.featuredCategories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  final category = controller.featuredCategories[index];
                  return TVerticalImageText(
                    image: category.image,
                    title: category.name,
                    onPress: () => Get.to(() => const SportScreen()),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}

/// Shimmer Skeleton Widget
class _CategoryShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
              width: 55,
              height: 55,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Container(
              width: 55,
              height: 8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}