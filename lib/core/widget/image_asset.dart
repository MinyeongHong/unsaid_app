import 'package:flutter/material.dart';

class CustomImageAsset extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final String name;
  final BoxFit fit;

  const CustomImageAsset({
    super.key,
    this.margin,
    this.width,
    this.height,
    required this.name,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Image.asset(
        'assets/images/$name.png',
        width: width,
        height: height,
        fit: fit,
      ),
    );
  }
}
