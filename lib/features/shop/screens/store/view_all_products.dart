import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/TRoundContainer.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/layout/gird_layout.dart';
import 'package:t_store/common/widgets/products/product_card_vertical.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ViewAllProductsScreen extends StatefulWidget {
  const ViewAllProductsScreen({super.key});

  @override
  State<ViewAllProductsScreen> createState() => _ViewAllProductsScreenState();
}

class _ViewAllProductsScreenState extends State<ViewAllProductsScreen> {
  final List<String> _filterOptions = [
    'Higher Price',
    'Lower Price',
    'Sale',
    'Newest',
    'Popularity',
  ];

  String _selectedFilter = 'Higher Price';

  void _openFilterSheet() {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(TSizes.cardRadiusLg)),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: TSizes.defaultSpace,
            vertical: TSizes.spaceBtwItems,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 48,
                  height: 4,
                  decoration: BoxDecoration(
                    color: TColors.grey,
                    borderRadius: BorderRadius.circular(TSizes.sm),
                  ),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                'Sort by',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              ..._filterOptions.map((option) {
                final selected = option == _selectedFilter;
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(option),
                  trailing: selected
                      ? const Icon(Iconsax.arrow_right_3, size: TSizes.iconMd)
                      : null,
                  onTap: () {
                    setState(() {
                      _selectedFilter = option;
                    });
                    Navigator.of(context).pop();
                  },
                );
              }),
              const SizedBox(height: TSizes.spaceBtwItems),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Popular Products'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Products',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              GestureDetector(
                onTap: _openFilterSheet,
                child: TRoundedContainer(
                  padding: const EdgeInsets.symmetric(
                    horizontal: TSizes.sm,
                    vertical: TSizes.xs,
                  ),
                  backgroundColor: isDark ? TColors.darkerGrey : TColors.light,
                  child: Row(
                    children: [
                      const Icon(
                        Iconsax.sort,
                        size: TSizes.iconMd,
                        color: TColors.textPrimary,
                      ),
                      const SizedBox(width: TSizes.xs),
                      Text(
                        _selectedFilter,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          TGridLayout(
            itemCount: 12,
            itemBuilder: (_, index) => const TProductCardVertical(),
          ),
        ],
      ),
    );
  }
}
