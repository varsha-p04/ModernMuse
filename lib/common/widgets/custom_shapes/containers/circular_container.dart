
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    Key? key,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.backgroundColor =TColors.white,
    this.child, this.margin,
  }) : super(key: key);

  final double width;
  final double height;
  final double radius;
  final double padding;
  final EdgeInsets? margin;
  final Color backgroundColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
