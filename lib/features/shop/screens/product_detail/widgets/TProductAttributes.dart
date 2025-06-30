import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/TRoundContainer.dart';
import 'package:t_store/common/widgets/TSectionHeading.dart';
import 'package:t_store/common/widgets/choice/choice_Chip.dart';
import 'package:t_store/features/shop/screens/product_detail/widgets/TProductPriceText.dart';
import 'package:t_store/features/shop/screens/product_detail/widgets/TProductTitleText.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        /// -- Selected Attribute Pricing & Description

        /// -- Attributes
        Column(
          children: [
            TRoundedContainer(
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title, Price and Stock Status
                  Row(
                    children: [
                      const TSectionHeading(
                          title: 'Variation', showActionButton: false),
                      const SizedBox(width: TSizes.spaceBtwItems),
                      Column(
                        children: [
                          Row(
                            children: [
                              const TProductTitleText(
                                title: 'Price: ',
                                smallSize: true,
                              ),
                              const SizedBox(width: TSizes.spaceBtwItems),

                              /// Actual Price
                              Text(
                                '\$25',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .apply(
                                      decoration: TextDecoration.lineThrough,
                                    ),
                              ),
                              const SizedBox(width: TSizes.spaceBtwItems),

                              /// Sale Price
                              const TProductPriceText(price: '20'),
                            ],
                          ),
                          Row(
                            children: [
                              const TProductTitleText(
                                title: 'Stock: ',
                                smallSize: true,
                              ),
                              Text('In Stock',
                                  style:
                                      Theme.of(context).textTheme.titleMedium)
                            ],
                          )
                        ],
                      ),
                    ],
                  ),

                  /// Variation Description
                  const TProductTitleText(
                    title: 'Description title',
                    smallSize: true,
                    maxLines: 4,
                  )
                ],
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            Wrap(
              children: [
                TChoiceChip(
                    text: 'Green', selected: false, onSelected: (value) {}),
                TChoiceChip(
                    text: 'Blue', selected: true, onSelected: (value) {}),
                TChoiceChip(
                    text: 'Yellow', selected: false, onSelected: (value) {}),
                TChoiceChip(
                    text: 'Green', selected: false, onSelected: (value) {}),
                TChoiceChip(
                    text: 'Blue', selected: true, onSelected: (value) {}),
                TChoiceChip(
                    text: 'Yellow', selected: false, onSelected: (value) {}),
              ],
            ),
          ],
        ),

        Column(
          children: [
            const TSectionHeading(title: 'Size'),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                    text: 'EU 34', selected: true, onSelected: (value) {}),
                TChoiceChip(
                    text: 'EU 36', selected: false, onSelected: (value) {}),
                TChoiceChip(
                    text: 'EU 38', selected: false, onSelected: (value) {}),
                TChoiceChip(
                    text: 'EU 34', selected: true, onSelected: (value) {}),
                TChoiceChip(
                    text: 'EU 36', selected: false, onSelected: (value) {}),
                TChoiceChip(
                    text: 'EU 38', selected: false, onSelected: (value) {}),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
