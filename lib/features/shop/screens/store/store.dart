import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/TCart.dart';
import 'package:t_store/common/widgets/TRoundContainer.dart';
import 'package:t_store/common/widgets/TSectionHeading.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/image/TCircularImage.dart';
import 'package:t_store/common/widgets/layout/gird_layout.dart';
import 'package:t_store/common/widgets/text/brand_title_with_verified_icon.dart';
import 'package:t_store/features/shop/screens/home/widget/home_search.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCartCounterIcon(onPress: () {}),
        ],
      ), // TAppBar
      body: NestedScrollView(
        headerSliverBuilder: (_, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              backgroundColor: isDark ? TColors.black : TColors.white,
              expandedHeight: 440,
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    /// Search bar
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const TSearchContainer(
                      text: '',
                      showBorder: true,
                      padding: EdgeInsets.zero,
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    TSectionHeading(
                        title: 'Feature Brands',
                        onPress: () {},
                        showActionButton: true,
                        buttonTitle: 'View all'),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    TGridLayout(
                      itemCount: 4,
                      mainAxisExtent: 80,
                      itemBuilder: (_, index) => TRoundedContainer(
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
                      ), // (),),
                    )
                  ],
                ),
              ),
            ),
          ];
        },
        body: Container(),
      ),
    );
  }
}
