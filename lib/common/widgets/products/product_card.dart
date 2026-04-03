import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/TRoundContainer.dart';
import 'package:t_store/common/widgets/image/TRoundedImage.dart';
import 'package:t_store/common/widgets/TCircularIcon.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TProductCard extends StatelessWidget {
  const TProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.brand,
    required this.price,
    this.discountPercent,
    this.isFavorite = false,
    this.onFavoriteTap,
    this.onTap,
  });

  final String imageUrl;
  final String title;
  final String brand;
  final String price;
  final int? discountPercent;
  final bool isFavorite;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: TRoundedContainer(
        radius: TSizes.productImageRadius,
        backgroundColor: dark ? TColors.darkerGrey : TColors.white,
        borderColor: TColors.borderPrimary,
        showBorder: true,
        padding: const EdgeInsets.all(TSizes.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                TRoundedImage(
                  imageUrl: imageUrl,
                  borderRadius: TSizes.productImageRadius,
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                if (discountPercent != null)
                  Positioned(
                    top: TSizes.sm,
                    left: TSizes.sm,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withValues(alpha: 0.9),
                      padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.sm,
                        vertical: TSizes.xs,
                      ),
                      child: Text(
                        '-$discountPercent% ',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.black),
                      ),
                    ),
                  ),
                Positioned(
                  top: TSizes.sm,
                  right: TSizes.sm,
                  child: TCircularIcon(
                    icon: isFavorite ? Iconsax.heart5 : Iconsax.heart,
                    width: 34,
                    height: 34,
                    size: TSizes.iconSm,
                    color: isFavorite ? Colors.red : TColors.textSecondary,
                    backgroundColor: dark ? TColors.darkGrey : TColors.light,
                    onPressed: onFavoriteTap,
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 4),
            Text(
              brand,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$$price',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .apply(color: TColors.primary, fontWeightDelta: 2),
                ),
                SizedBox(
                  width: TSizes.iconLg * 1.2,
                  height: TSizes.iconLg * 1.2,
                  child: ElevatedButton(
                    onPressed: onTap,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
                      ),
                      backgroundColor: TColors.primary,
                    ),
                    child: const Icon(Iconsax.add, color: TColors.white, size: TSizes.iconSm),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
