import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/TPrimaryHeaderContainer.dart';
import 'package:t_store/features/authentication/screens/home/widget/THomeCategories.dart';
import 'package:t_store/features/authentication/screens/home/widget/TPromoSlider.dart';
import 'package:t_store/features/authentication/screens/home/widget/home_appbar.dart';
import 'package:t_store/features/authentication/screens/home/widget/home_search.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  THomeAppBar(),
                  SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TSearchContainer(
                    text: 'Search in Store',
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  THomeCategories()
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: TPromoSlider(
                autoPlay: true,
                banners: [TImages.banner1, TImages.banner2, TImages.banner3],
              ),
            )
          ],
        ),
      ),
    );
  }
}
