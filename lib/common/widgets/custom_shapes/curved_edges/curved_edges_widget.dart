import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/curved_edges/curved_edges.dart';

import '../../../../utils/constants/colors.dart';

class TCurveEdgeWidget extends StatelessWidget {
  const TCurveEdgeWidget({
    super.key,
    required this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TCustomCurvedEdges(),
      child: Container(
        color: TColors.primary,
        padding: const EdgeInsets.all(0),
        child: child,
      ),
    );
  }
}