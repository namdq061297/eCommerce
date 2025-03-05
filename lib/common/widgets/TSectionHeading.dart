import 'package:flutter/material.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    required this.title,
    this.buttonTitle,
    this.showActionButton = true,
    this.textColor,
    this.onPress,
  });

  final String title;
  final String? buttonTitle;
  final bool? showActionButton;
  final Color? textColor;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.apply(color: textColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            if (showActionButton != null ) TextButton(onPressed: onPress, child: Text(buttonTitle ?? ''))
          ],
        )
      ],
    );
  }
}
