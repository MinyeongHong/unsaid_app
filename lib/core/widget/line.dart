import 'package:flutter/material.dart';
import 'package:unsaid_app/core/util/color.dart';

class ThinLineCard extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final Color color;

  const ThinLineCard({
    Key? key,
    this.margin,
    this.color = CustomColor.gray010,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: 1,
      color: color,
    );
  }
}

class ThickLineCard extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final double height;

  const ThickLineCard({
    Key? key,
    this.margin,
    this.height = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      color: Color(0xffF2F4F6),
    );
  }
}
