import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoading extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final double size;
  final double lineWidth;
  final Color color;

  const CustomLoading({
    Key? key,
    this.margin,
    this.size = 35,
    this.lineWidth = 1.5,
    this.color = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: SpinKitRing(
        size: size,
        lineWidth: lineWidth,
        color: color,
      ),
    );
  }
}

class ButtonLoading extends StatelessWidget {
  final double size;
  final Color color;

  const ButtonLoading({
    Key? key,
    this.size = 25,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      size: size,
      color: color,
    );
  }
}

class CustomOverlay extends StatefulWidget {
  final double opacity;
  final bool isLoading;
  final Widget child;

  const CustomOverlay({
    super.key,
    this.opacity = 0.5,
    required this.isLoading,
    required this.child,
  });

  @override
  State<CustomOverlay> createState() => _CustomOverlayState();
}

class _CustomOverlayState extends State<CustomOverlay> {
  bool _isLoading = false;

  @override
  void didUpdateWidget(CustomOverlay customOverlay) {
    setState(() {
      if (!customOverlay.isLoading && widget.isLoading) {
        _isLoading = true;
      } else if (customOverlay.isLoading && !widget.isLoading) {
        _isLoading = false;
      }
    });
    super.didUpdateWidget(customOverlay);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !_isLoading,
      child: Stack(
        alignment: Alignment.center,
        children: [
          widget.child,
          if (widget.opacity > 0)
            IgnorePointer(
              ignoring: !_isLoading,
              child: AnimatedOpacity(
                opacity: _isLoading ? 1 : 0,
                duration: Duration(milliseconds: 500),
                child: Container(
                  color: Colors.black.withOpacity(widget.opacity),
                ),
              ),
            )
          else
            Container(),
        ],
      ),
    );
  }
}
