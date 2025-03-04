import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/TPrimaryHeaderContainer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(child: Container()),
          ],
        ),
      ),
    );
  }
}

