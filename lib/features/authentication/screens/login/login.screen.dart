import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: 
        EdgeInsets.only(
          top: TSizes.appBarHeight,
          left: TSizes.defaultSpace,
          bottom: TSizes.defaultSpace,
          right: TSizes.defaultSpace,
        ) 
        ),
      ),
    );
  }
}