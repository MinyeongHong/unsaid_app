import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLottieAsset extends StatefulWidget {
  final void Function()? onCompleted;
  final Function? onForward;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final String name;
  final bool repeat;
  final bool isForward;
  final Duration duration;

  const CustomLottieAsset({
    super.key,
    this.onCompleted,
    this.onForward,
    this.margin,
    this.width,
    this.height,
    required this.name,
    this.repeat = true,
    this.isForward = true,
    this.duration = const Duration(seconds: 20),
  });

  @override
  State<CustomLottieAsset> createState() => _CustomLottieAssetState();
}

class _CustomLottieAssetState extends State<CustomLottieAsset>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          if (widget.onCompleted != null) {
            widget.onCompleted!();
          }
        }
      });

    if (widget.isForward) {
      if (widget.onForward != null) {
        widget.onForward!(() {
          _animationController.forward();
        });
      } else {
        _animationController.forward();
      }
    }

    if (widget.repeat) {
      _animationController.repeat();
    }
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => _animationController.isCompleted;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Container(
      margin: widget.margin,
      child: Lottie.asset(
        widget.name,
        controller: _animationController,
        width: widget.width,
        height: widget.height,
        repeat: widget.repeat,
      ),
    );
  }
}
