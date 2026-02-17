import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvgAsset extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final String name;
  final Color? color;
  final BoxFit fit;

  const CustomSvgAsset({
    super.key,
    this.margin,
    this.width,
    this.height,
    required this.name,
    this.color,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: SvgPicture.asset(
        'assets/$name.svg',
        width: width,
        height: height,
        colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
        fit: fit,
      ),
    );
  }
}
