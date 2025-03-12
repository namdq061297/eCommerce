import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/TSectionHeading.dart';
import 'package:t_store/common/widgets/TVerticalImageText.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: TSizes.defaultSpace),
      child: Column(
        children: [
          const TSectionHeading(
            title: 'Popular Categories',
            buttonTitle: '',
            showActionButton: true,
            textColor: Colors.white,
          ),
          SizedBox(
            height: 80,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return const TVerticalImageText(
                    image: TImages.shoeIcon,
                    title: 'Shoes',
                  );
                }),
          )
        ],
      ),
    );
  }
}