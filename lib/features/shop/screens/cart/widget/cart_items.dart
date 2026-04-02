import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/products/add_remove_button.dart';
import 'package:t_store/common/widgets/products/cart_item_product.dart';
import 'package:t_store/features/shop/screens/product_detail/widgets/TProductPriceText.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key,  this.showAddRemoveBtn = true, this.shrinkWrap = false, this.physics});

  final bool showAddRemoveBtn;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: shrinkWrap,
      physics: physics,
      itemCount: 10,
      separatorBuilder: (context, index) => const SizedBox(height: TSizes.spaceBtwSections),
      itemBuilder: (context, index) => Column(
        children: [
          const TCartItem(),
          if (showAddRemoveBtn) const SizedBox(height: TSizes.spaceBtwItems),
          if (showAddRemoveBtn) const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 80),
                  TProductQuanityWithAddRemoveButton(),
                ],
              ),
              TProductPriceText(price: '102'),
            ],
          ),
          if (index < 9) const SizedBox(height: TSizes.spaceBtwSections), // Add separator except for last item
        ],
      ));
  }
}
