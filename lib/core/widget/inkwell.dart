import 'package:flutter/material.dart';

class CustomInkWell extends StatelessWidget {
  final void Function()? onTap;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color color;
  final BorderRadius? borderRadius;
  final Widget child;

  const CustomInkWell({
    Key? key,
    this.onTap,
    this.margin,
    this.padding,
    this.color = Colors.transparent,
    this.borderRadius,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Material(
        color: color,
        borderRadius: borderRadius,
        child: InkWell(
          onTap: onTap,
          borderRadius: borderRadius,
          child: Container(
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}
