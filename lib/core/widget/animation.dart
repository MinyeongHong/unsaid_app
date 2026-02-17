import 'package:flutter/material.dart';

class FadeInDownAnimationCard extends StatefulWidget {
  final void Function()? onCompleted;
  final Widget child;

  const FadeInDownAnimationCard({
    super.key,
    this.onCompleted,
    required this.child,
  });

  @override
  State<FadeInDownAnimationCard> createState() => _FadeInDownAnimationCardState();
}

class _FadeInDownAnimationCardState extends State<FadeInDownAnimationCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    _animationController =
        AnimationController(
          vsync: this,
          duration: Duration(milliseconds: 500),
        )..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            if (widget.onCompleted != null) {
              widget.onCompleted!();
            }
          }
        });

    _animation =
        Tween<double>(
          begin: -25,
          end: 0,
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOut,
          ),
        );

    _opacityAnimation =
        Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Interval(0, 1),
          ),
        );

    _animationController.reset();
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, _) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: widget.child,
          ),
        );
      },
    );
  }
}

class FadeInUpAnimationCard extends StatefulWidget {
  final void Function()? onCompleted;
  final Function? onForward;
  final Function? onReverse;
  final double begin;
  final bool isAnimation;
  final Duration delayDuration;
  final Widget child;

  const FadeInUpAnimationCard({
    super.key,
    this.onCompleted,
    this.onForward,
    this.onReverse,
    this.begin = 200,
    this.isAnimation = true,
    this.delayDuration = Duration.zero,
    required this.child,
  });

  @override
  State<FadeInUpAnimationCard> createState() => _FadeInUpAnimationCardState();
}

class _FadeInUpAnimationCardState extends State<FadeInUpAnimationCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    _animationController =
        AnimationController(
          vsync: this,
          duration: Duration(milliseconds: 500),
        )..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            if (widget.onCompleted != null) {
              widget.onCompleted!();
            }
          }
        });

    _animation =
        Tween<double>(
          begin: widget.begin,
          end: 0,
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOut,
          ),
        );

    _opacityAnimation =
        Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Interval(0, 1),
          ),
        );

    Future.delayed(
      widget.delayDuration,
      () {
        _animationController.forward();
      },
    );

    if (widget.onForward != null) {
      widget.onForward!(() {
        _animationController.reset();
        _animationController.forward();
      });
    }

    if (widget.onReverse != null) {
      widget.onReverse!(() async {
        _animationController.reverse();

        await Future.delayed(Duration(milliseconds: 400));

        _animationController.value = 1;
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isAnimation) {
      return widget.child;
    }

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, _) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: widget.child,
          ),
        );
      },
    );
  }
}
