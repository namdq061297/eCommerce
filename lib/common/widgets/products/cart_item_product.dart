
import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/image/TRoundedImage.dart';
import 'package:t_store/common/widgets/text/brand_title_with_verified_icon.dart';
import 'package:t_store/features/shop/screens/product_detail/widgets/TProductTitleText.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Image
        TRoundedImage(
          imageUrl: TImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          bgColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const TBrandTitleWithVerifiedIcon(title: 'Nike'),
            const Flexible(
                child: TProductTitleText(
              title: 'Black sports shoes',
              maxLines: 1,
            )),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: 'Color ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: 'Green ',
                  style: Theme.of(context).textTheme.bodyLarge),
              TextSpan(
                  text: 'Size ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: 'UK 08',
                  style: Theme.of(context).textTheme.bodyLarge),
            ]))
          ],
        ))
      ],
    );
  }
}
