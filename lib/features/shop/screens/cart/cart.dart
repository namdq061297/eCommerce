import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/products/add_remove_button.dart';
import 'package:t_store/common/widgets/products/cart_item_product.dart';
import 'package:t_store/features/shop/screens/product_detail/widgets/TProductPriceText.dart';
import 'package:t_store/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (_, __) =>
              const SizedBox(height: TSizes.spaceBtwSections),
          itemCount: 20,
          itemBuilder: (_, index) => const Column(
            children: [
              TCartItem(),
              SizedBox(height: TSizes.spaceBtwItems),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(
                  children: [
                    SizedBox(width: 80),
                    TProductQuanityWithAddRemoveButton(),
                  ],
                ),
                TProductPriceText(price: '102'),
              ])
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(TSizes.defaultSpace, 0, TSizes.defaultSpace, TSizes.defaultSpace),
        child: ElevatedButton(onPressed: (){}, child: const Text('Checkout \$102')),
      ),
    );
  }
}
