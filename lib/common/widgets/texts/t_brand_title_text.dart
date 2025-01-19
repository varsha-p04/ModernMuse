import 'package:flutter/material.dart';

import '../../../utils/constants/enums.dart';
class TBrandTitleText extends StatelessWidget {
  const TBrandTitleText({
    super.key,
    this.color,
    this.maxLines,
    required this.title,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final Color? color;
  final String title;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle;
    switch (brandTextSize) {
      case TextSizes.small:
        textStyle = Theme.of(context).textTheme.labelMedium;
        break;
      case TextSizes.bodyMedium:
        textStyle = Theme.of(context).textTheme.bodyLarge;
        break;
      case TextSizes.large:
        textStyle = Theme.of(context).textTheme.titleLarge;
        break;
      default:
        textStyle = Theme.of(context).textTheme.bodyMedium;
        break;
    }

    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: textStyle?.apply(color: color),
    );
  }
}
