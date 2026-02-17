import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unsaid_app/core/widget/app_bar.dart';
import 'package:unsaid_app/core/widget/loading.dart';

class CustomScaffold extends StatelessWidget {
  final void Function()? onTap;
  final void Function()? onTapAppBar;
  final void Function()? onScrollTop;
  final String? title;
  final bool canPop;
  final bool isLoading;
  final bool isLeading;
  final bool resizeToAvoidBottomInset;
  final bool isFullscreen;
  final Color? backgroundColor;
  final ScrollController? scrollController;
  final SystemUiOverlayStyle systemUiOverlayStyle;
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? positioned;
  final List<Widget>? actions;

  const CustomScaffold({
    Key? key,
    this.onTap,
    this.onTapAppBar,
    this.onScrollTop,
    this.title,
    this.canPop = true,
    this.isLoading = false,
    this.isLeading = true,
    this.resizeToAvoidBottomInset = true,
    this.isFullscreen = false,
    this.backgroundColor,
    this.scrollController,
    this.systemUiOverlayStyle = SystemUiOverlayStyle.dark,
    this.appBar,
    required this.body,
    this.positioned,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      child: CustomOverlay(
        isLoading: isLoading,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();

            if (onTap != null) {
              onTap!();
            }
          },
          child: AnnotatedRegion(
            value: systemUiOverlayStyle,
            child: Material(
              type: MaterialType.transparency,
              child: Stack(
                children: [
                  Scaffold(
                    resizeToAvoidBottomInset: resizeToAvoidBottomInset,
                    backgroundColor: backgroundColor,
                    appBar: title != null
                        ? CustomAppBar(
                            onTap: onTapAppBar,
                            title: title!,
                            canPop: canPop,
                            isLeading: isLeading,
                            isFullscreen: isFullscreen,
                            actions: actions,
                          )
                        : appBar ?? null,
                    body: body,
                  ),
                  positioned ?? Container(),
                  if (scrollController != null)
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      height: MediaQuery.of(context).padding.top,
                      child: GestureDetector(
                        onTap: () {
                          scrollController!.animateTo(
                            0,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeOutCirc,
                          );

                          if (onScrollTop != null) {
                            onScrollTop!();
                          }
                        },
                      ),
                    )
                  else
                    Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
