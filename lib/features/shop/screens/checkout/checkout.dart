import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/commons_screen/success_screen.dart';
import 'package:t_store/common/widgets/TRoundContainer.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/products/coupon_widget.dart';
import 'package:t_store/data/repositories/authentication/authentication.repository.dart';
import 'package:t_store/features/shop/screens/cart/widget/cart_items.dart';
import 'package:t_store/features/shop/screens/checkout/widget/billing_address_section.dart';
import 'package:t_store/features/shop/screens/checkout/widget/billing_amount_section.dart';
import 'package:t_store/features/shop/screens/checkout/widget/billing_payment_section.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Order Review',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Items in Cart
              const TCartItems(
                  showAddRemoveBtn: false,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics()),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// -- Coupon TextField
              TCouponCode(dark: dark), // TRoundedContainer
              const SizedBox(height: TSizes.spaceBtwSections),
              TRoundedContainer(
                padding: const EdgeInsets.all(TSizes.md),
                showBorder: true,
                backgroundColor: dark ? TColors.dark : TColors.white,
                child: Column(
                  children: [
                    const TBillingAmountSection(),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    const Divider(),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    TBillingPaymentSection(dark: dark),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    const TBillingAddressSection()
                  ],
                ),
              )
            ],
          ), // Column
        ), // Padding
      ), // SingleChildScrollView
      bottomNavigationBar: ElevatedButton(
          onPressed: () => Get.to(SuccessScreen(
                image: TImages.successfulPaymentIcon,
                subTitle: 'Your order has been placed successfully!',
                title: 'Order Placed',
                onPressed: AuthenticationRepository.instance.screenRedirect()
              )),
          child: const Text('Checkout')),
    ); // Scaffold
  }
}
