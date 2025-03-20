import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/TCircularContainer.dart';
import 'package:t_store/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:t_store/utils/constants/colors.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key, required this.child,
  });

  final Widget child; 

  @override
  Widget build(BuildContext context) {
    return TCurveEdgeWidget(
      child: Container(
        color: TColors.primary,
        child: Stack(
          children: [
            const Positioned(
              top: -150,
              right: -250,
              child: TCircularContainer(
                child: null,
                bgColor: TColors.accent,
                padding: 0,
              ),
            ),
            const Positioned(
              top: 100,
              right: -300,
              child: TCircularContainer(
                child: null,
                bgColor: TColors.accent,
                padding: 0,
              ),
            ),
            child
          ],
        ),
      ),
    );
  }
}

