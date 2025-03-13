import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/TRoundContainer.dart';
import 'package:t_store/common/widgets/image/TCircularImage.dart';
import 'package:t_store/common/widgets/text/brand_title_with_verified_icon.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';


class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    required this.isDark, required bool showBorder,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      padding: const EdgeInsets.all(TSizes.sm),
      showBorder: true,
      backgroundColor: Colors.transparent,
      child: Row(
        children: [
          // --- Icon
          Flexible(
            child: TCircularImage(
              isNetworkImage: false,
              image: TImages.clothIcon,
              backgroundColor: Colors.transparent,
              overlayColor:
                  isDark ? TColors.white : TColors.black,
            ),
          ), // TCircularImage
          // --- Text
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TBrandTitleWithVerifiedIcon(
                    title: 'Nike',
                    brandTextSize: TextSizes.large),
                Text(
                  '124 products 1212 121221',
                  overflow: TextOverflow.ellipsis,
                  style:
                      Theme.of(context).textTheme.labelMedium,
                )
              ],
            ),
          ), // Column
        ],
      ), // Row
    );
  }
}
