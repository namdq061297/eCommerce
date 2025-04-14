import 'package:flutter/material.dart';


class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.fit = BoxFit.contain,
    this.border,
    this.padding,
    this.isNetWorkUrl,
    this.onPress,
    this.borderRadius,
    this.bgColor,
  });

  final double? width, height;
  final String imageUrl;
  final BoxFit? fit;
  final BoxBorder? border;
  final EdgeInsetsGeometry? padding;
  final bool? isNetWorkUrl;
  final VoidCallback? onPress;
  final double? borderRadius;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 0), border: border, color: bgColor),
        width: width,
        height: height,
        padding: padding,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          child: Image(
            image: (isNetWorkUrl ?? false)
                ? NetworkImage(imageUrl)
                : AssetImage(imageUrl) as ImageProvider<Object>,
            fit: fit,
          ),
        ),
      ),
    );
  }
}
