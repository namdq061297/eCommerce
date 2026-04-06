import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/TSectionHeading.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/shop/screens/home/widget/TPromoSlider.dart';
import 'package:t_store/features/shop/screens/store/view_all_products.dart';
import 'package:t_store/features/shop/screens/sport/widgets/sport_category_card.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final categories = <Map<String, String?>>[
      {
        'title': 'Sports Equipments',
        'description': 'S0thwuid dbnsjlka bcdsjka bcdsj bndsjakl bdnxj dsad ...',
        'brand': 'Adidas',
        'price': '\$40.0',
        'image': TImages.productImage4,
        'discount': null,
      },
      {
        'title': 'Sport Shoes',
        'description': 'S0thwuid dbnsjlka bcdsjka bcdsj bndsjakl bdnxj dsad ...',
        'brand': 'Nike',
        'price': '\$12.6 - 35.0',
        'image': TImages.productImage1,
        'discount': '14%',
      },
      {
        'title': 'Track suits',
        'description': 'S0thwuid dbnsjlka bcdsjka bcdsj bndsjakl bdnxj dsad ...',
        'brand': 'Nike',
        'price': '\$6.0 - 80.0',
        'image': TImages.productImage6,
        'discount': '50%',
      },
    ];

    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Sports'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TPromoSlider(
                autoPlay: true,
                banners: [
                  TImages.banner1,
                  TImages.banner2,
                  TImages.banner3,
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              ...categories.map((category) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TSectionHeading(
                      title: category['title']!,
                      buttonTitle: 'View all',
                      showActionButton: true,
                      onPress: () => Get.to(() => const ViewAllProductsScreen()),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    SizedBox(
                      height: 140,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        separatorBuilder: (_, __) => const SizedBox(width: TSizes.spaceBtwItems),
                        itemBuilder: (context, index) {
                          return SportCategoryCard(
                            imageUrl: category['image']!,
                            title: category['title']!,
                            subtitle: category['description']!,
                            brand: category['brand']!,
                            price: category['price']!,
                            discount: category['discount'],
                            dark: dark,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections / 2),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

}
