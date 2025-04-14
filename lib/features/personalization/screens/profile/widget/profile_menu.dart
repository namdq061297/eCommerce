import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TProfileMenu extends StatefulWidget {
  const TProfileMenu({
    super.key, 
    this.icon = Iconsax.arrow_right_34, 
    required this.onPress, 
    required this.title, 
    required this.value,
  });

  final IconData? icon;
  final VoidCallback onPress;
  final String title, value;

  @override
  _TProfileMenuState createState() => _TProfileMenuState();
}

class _TProfileMenuState extends State<TProfileMenu> {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() => _scale = 0.95); // Shrink effect on tap down
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _scale = 1.0); // Return to normal size
    widget.onPress(); // Trigger the onPress action
  }

  void _onTapCancel() {
    setState(() => _scale = 1.0); // Reset scale if tap is canceled
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems / 2),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                flex: 5,
                child: Text(
                  widget.value,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                child: Icon(widget.icon, size: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
