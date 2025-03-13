import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/TCart.dart';
import 'package:t_store/common/widgets/TRoundContainer.dart';
import 'package:t_store/common/widgets/TSectionHeading.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/appbar/tabbar.dart';
import 'package:t_store/common/widgets/brand/brand_card.dart';
import 'package:t_store/common/widgets/layout/gird_layout.dart';
import 'package:t_store/features/shop/screens/home/widget/home_search.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          title:
              Text('Store', style: Theme.of(context).textTheme.headlineMedium),
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
                        itemBuilder: (_, index) =>
                            TBrandCard(isDark: isDark, showBorder: true,), // (),),
                      )
                    ],
                  ),
                ),
                bottom: const TTabBar(
                  tabs: [
                    Tab(child: Text('Sports')),
                    Tab(child: Text('Furniture')),
                    Tab(child: Text('Electronics')),
                    Tab(child: Text('Clothes')),
                    Tab(child: Text('Cosmetics')),
                  ],
                ),
              ),
            ];
          },
          body: Column(
            children: [
              /// --- Brands
              TRoundedContainer(
                showBorder: true,
                borderColor: TColors.darkGrey,
                backgroundColor: Colors.transparent,
                margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
                child: Column(
                  children: [
                    /// Brand with Products Count
                     TBrandCard(showBorder: false, isDark: isDark,),

                    /// Brand Top 3 Product Images
                    Row(
                      children: [
                        TRoundedContainer(
                          height: 100,
                          backgroundColor: isDark
                              ? TColors.darkerGrey
                              : TColors.light,
                          margin: const EdgeInsets.only(right: TSizes.sm),
                          padding: const EdgeInsets.only(right: TSizes.sm),
                          child: const Image(image: AssetImage(TImages.productImage1), fit: BoxFit.contain,),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
