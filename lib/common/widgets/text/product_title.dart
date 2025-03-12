import 'package:flutter/material.dart';

class TProductTitle extends StatelessWidget {
  const TProductTitle({
    super.key,
    required this.title,
    this.smallSize = false,
    this.maxLines = 2,
    this.textAlign = TextAlign.left,
  });

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    final textStyle = smallSize
        ? Theme.of(context).textTheme.labelLarge
        : Theme.of(context).textTheme.titleSmall;

    return Text(
      title,
      style: textStyle,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
