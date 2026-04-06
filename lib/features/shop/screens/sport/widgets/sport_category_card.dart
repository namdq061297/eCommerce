import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/TRoundContainer.dart';
import 'package:t_store/common/widgets/TCircularIcon.dart';
import 'package:t_store/common/widgets/image/TRoundedImage.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class SportCategoryCard extends StatelessWidget {
  const SportCategoryCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.brand,
    required this.price,
    this.discount,
    required this.dark,
  });

  final String imageUrl;
  final String title;
  final String subtitle;
  final String brand;
  final String price;
  final String? discount;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      width: 280,
      showBorder: true,
      borderColor: TColors.borderPrimary,
      backgroundColor: dark ? TColors.darkerGrey : TColors.lightGrey,
      padding: const EdgeInsets.all(TSizes.sm),
      // ✅ Bọc Stack bên ngoài Row để dùng được Positioned
      child: Stack(
        children: [
          // Nội dung chính
          Row(
            children: [
              TRoundedImage(
                imageUrl: imageUrl,
                width: 90,
                height: 90,
                borderRadius: TSizes.productImageRadius,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems / 2),
                        Text(
                          brand,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          price,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .apply(color: TColors.black),
                        ),
                        TCircularIcon(
                          icon: Iconsax.add,
                          width: 40,
                          height: 40,
                          size: TSizes.iconMd,
                          backgroundColor: TColors.dark,
                          color: TColors.white,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          // ✅ Discount tag — góc trên trái
          if (discount != null)
            Positioned(
              top: 0,
              left: 0,
              child: TRoundedContainer(
                radius: TSizes.sm,
                padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm,
                  vertical: TSizes.xs,
                ),
                backgroundColor: TColors.secondary,
                child: Text(
                  discount!,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .apply(color: TColors.black),
                ),
              ),
            ),
        ],
      ),
    );
  }
}