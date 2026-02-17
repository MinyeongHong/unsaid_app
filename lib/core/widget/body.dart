import 'package:flutter/cupertino.dart';
import 'package:unsaid_app/core/util/size.dart';

class CustomBody extends StatelessWidget {
  final double? bottom;
  final double? cacheExtent;
  final bool top;
  final ScrollController? controller;
  final ScrollPhysics physics;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final Widget? tabBar;
  final Widget? sliverFillRemaining;
  final Widget? positioned;
  final Widget? twoPositioned;
  final List<Widget> children;

  const CustomBody({
    Key? key,
    this.bottom,
    this.cacheExtent,
    this.top = false,
    this.controller,
    this.physics = const AlwaysScrollableScrollPhysics(),
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.tabBar,
    this.sliverFillRemaining,
    this.positioned,
    this.twoPositioned,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: top,
      bottom: false,
      child: Stack(
        children: [
          CustomScrollView(
            controller: controller,
            physics: physics,
            cacheExtent: cacheExtent,
            keyboardDismissBehavior: keyboardDismissBehavior,
            slivers: [
              SliverToBoxAdapter(),
              SliverPadding(
                padding: EdgeInsets.only(
                  top: tabBar != null ? tabBarHeight : 0,
                ),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    children,
                  ),
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: bottom ?? screenBottom,
                  ),
                  alignment: Alignment.bottomCenter,
                  child: sliverFillRemaining,
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            child: tabBar ?? Container(),
          ),
          positioned ?? Container(),
          twoPositioned ?? Container(),
        ],
      ),
    );
  }
}

class FixedBody extends StatelessWidget {
  final List<Widget> children;

  const FixedBody({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Container(
        margin: EdgeInsets.only(bottom: screenBottom),
        child: Column(
          children: [
            Flexible(
              child: Column(
                children: children,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
