import 'package:flutter/material.dart';
import 'package:unsaid_app/core/widget/svg_asset.dart';

class IconCard extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final double cardSize;
  final double? iconSize;
  final double radius;
  final String icon;
  final Color? color;
  final Color cardColor;

  const IconCard({
    super.key,
    this.margin,
    required this.cardSize,
    this.iconSize = 28,
    required this.radius,
    required this.icon,
    this.color,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: cardSize,
      height: cardSize,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Center(
        child: CustomSvgAsset(
          width: iconSize,
          height: iconSize,
          name: icon,
          color: color,
        ),
      ),
    );
  }
}
