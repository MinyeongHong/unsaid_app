import 'package:flutter/material.dart';
import 'package:unsaid_app/core/util/color.dart';
import 'package:unsaid_app/core/util/size.dart';
import 'package:unsaid_app/core/widget/inkwell.dart';
import 'package:unsaid_app/core/widget/loading.dart';
import 'package:unsaid_app/core/widget/text.dart';

class CustomButton extends StatelessWidget {
  final void Function() onTap;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double height;
  final String title;
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;
  final Color titleColor;
  final bool isActive;
  final bool isActiveTap;
  final bool isLoading;
  final BorderRadius? borderRadius;

  const CustomButton({
    Key? key,
    required this.onTap,
    this.margin,
    this.width,
    this.height = 56,
    required this.title,
    this.fontWeight = FontWeight.w700,
    this.fontSize = 18,
    this.color = CustomColor.gray090,
    this.titleColor = CustomColor.gray000,
    this.isActive = true,
    this.isActiveTap = true,
    this.isLoading = false,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width ?? screenWidth,
      height: height,
      decoration: BoxDecoration(
        color: isActive ? color : CustomColor.gray050,
        borderRadius: borderRadius ?? BorderRadius.circular(60),
      ),
      child: CustomInkWell(
        onTap: () {
          if (!isActive && isActiveTap) return;

          onTap();
        },
        borderRadius: borderRadius ?? BorderRadius.circular(60),
        child: Center(
          child: isLoading
              ? ButtonLoading()
              : NormalText(
                  title: title,
                  fontWeight: fontWeight,
                  fontSize: fontSize,
                  color: isActive ? titleColor : CustomColor.primary,
                  height: 1.2,
                  textAlign: TextAlign.center,
                ),
        ),
      ),
    );
  }
}

class FadeButton extends StatefulWidget {
  final void Function()? onTap;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color color;
  final Widget child;

  const FadeButton({
    super.key,
    this.onTap,
    this.margin,
    this.padding,
    this.color = Colors.transparent,
    required this.child,
  });

  @override
  State<FadeButton> createState() => _FadeButtonState();
}

class _FadeButtonState extends State<FadeButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  Tween<double> _tween = Tween<double>(begin: 1.0);
  bool _isButton = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      value: 0,
      duration: Duration(milliseconds: 200),
    );
    _animation = _animationController
        .drive(
          CurveTween(
            curve: Curves.decelerate,
          ),
        )
        .drive(_tween);

    _setTween();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(FadeButton old) {
    _setTween();
    super.didUpdateWidget(old);
  }

  void _setTween() {
    _tween.begin = 1.0;
    _tween.end = 0.4;
  }

  void _onTapUp(_) {
    if (widget.onTap != null) {
      if (_isButton) {
        _isButton = false;

        _animate();
      }
    }
  }

  void _onTapDown(_) {
    if (widget.onTap != null) {
      if (!_isButton) {
        _isButton = true;

        _animate();
      }
    }
  }

  void _onTapCancel() {
    if (widget.onTap != null) {
      if (_isButton) {
        _isButton = false;

        _animate();
      }
    }
  }

  void _animate() {
    if (_animationController.isAnimating) return;

    final bool isWasButton = _isButton;
    final TickerFuture tickerFuture = _isButton
        ? _animationController.animateTo(
            1,
            duration: Duration(milliseconds: 10),
          )
        : _animationController.animateTo(
            0,
            duration: Duration(milliseconds: 100),
          );

    tickerFuture.then((_) {
      if (mounted && isWasButton != _isButton) {
        _animate();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: widget.margin,
          color: widget.color,
          child: widget.onTap != null
              ? GestureDetector(
                  onTap: widget.onTap,
                  onTapUp: _onTapUp,
                  onTapDown: _onTapDown,
                  onTapCancel: _onTapCancel,
                  behavior: HitTestBehavior.opaque,
                  child: FadeTransition(
                    opacity: _animation,
                    child: Container(
                      padding: widget.padding ?? EdgeInsets.all(10),
                      child: Center(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: widget.child,
                      ),
                    ),
                  ),
                )
              : Container(
                  padding: widget.padding ?? EdgeInsets.all(10),
                  child: Center(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: widget.child,
                  ),
                ),
        ),
      ],
    );
  }
}

class BottomButton extends StatelessWidget {
  final void Function() onTap;

  final String title;
  final Color color;
  final Color titleColor;
  final bool isActive;
  final bool isLoading;
  final BorderRadius? borderRadius;

  const BottomButton({
    Key? key,
    required this.onTap,
    required this.title,
    this.color = CustomColor.gray090,
    this.titleColor = Colors.white,
    this.isActive = true,
    this.isLoading = false,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: CustomButton(
        onTap: onTap,
        margin: EdgeInsets.only(
          top: 8,
          left: 28,
          right: 28,
          bottom: MediaQuery.of(context).viewPadding.bottom > 0 ? screenBottom : 20,
        ),
        height: 64,
        title: title,
        color: color,
        titleColor: titleColor,
        isActive: isActive,
        isLoading: isLoading,
        borderRadius: borderRadius,
      ),
    );
  }
}
