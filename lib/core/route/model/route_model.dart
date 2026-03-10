import 'dart:io';
import 'package:unsaid_app/core/route/bloc/route_bloc.dart';
import 'package:unsaid_app/core/util/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteData {
  List<Page> pages;

  RouteData({
    required this.pages,
  });

  static String getPath(String key) {
    return key
        .replaceAll('[', '')
        .replaceAll(']', '')
        .replaceAll('<', '')
        .replaceAll('>', '')
        .replaceAll("'", '');
  }

  List<Page> getPages() {
    return [
      this.pages[0],
      if (this.pages.length > 1) this.pages[1],
      if (this.pages.length > 2) this.pages[2],
      if (this.pages.length > 3) this.pages[3],
      if (this.pages.length > 4) this.pages[4],
      if (this.pages.length > 5) this.pages[5],
      if (this.pages.length > 6) this.pages[6],
      if (this.pages.length > 7) this.pages[7],
      if (this.pages.length > 8) this.pages[8],
      if (this.pages.length > 9) this.pages[9],
      if (this.pages.length > 10) this.pages[10],
    ];
  }
}

class PageData {
  bool isAnimation;
  bool fullscreenDialog;
  Widget page;

  PageData({
    this.isAnimation = true,
    this.fullscreenDialog = false,
    required this.page,
  });

  String getPath() {
    final String path = '/${this.page.runtimeType.toString().replaceAll('Page', '')}';
    final List<String> paths = path.split('');

    String newPath = '';

    paths.asMap().forEach((index, p) {
      if (index == 1) {
        p = p.toLowerCase();
      } else {
        if (p != '/' && p == p.toUpperCase()) {
          p = '_' + p.toLowerCase();
        }
      }

      newPath = newPath + p;
    });

    return newPath;
  }

  Page getPage({
    String? path,
  }) {
    if (isAnimation) {
      if (Platform.isIOS) {
        return CupertinoPage(
          key: ValueKey(path ?? getPath()),
          fullscreenDialog: this.fullscreenDialog,
          child: this.page,
        );
      } else {
        return MaterialPage(
          key: ValueKey(path ?? getPath()),
          fullscreenDialog: this.fullscreenDialog,
          child: this.page,
        );
      }
    } else {
      return NoAnimationPage(
        key: ValueKey(path ?? getPath()),
        child: this.page,
      );
    }
  }
}

void addRoute({
  bool fullscreenDialog = false,
  required BuildContext context,
  required Widget page,
}) {
  final PageData pageData = PageData(
    fullscreenDialog: fullscreenDialog,
    page: page,
  );

  BlocProvider.of<RouteBloc>(context).add(
    RouteEvent.add(pageData),
  );
}

void resetRoute({
  bool fullscreenDialog = false,
  required Widget page,
}) {
  final PageData pageData = PageData(
    fullscreenDialog: fullscreenDialog,
    page: page,
  );

  BlocProvider.of<RouteBloc>(context).add(
    RouteEvent.reset(pageData),
  );
}

void deleteRoute(Page page) {
  BlocProvider.of<RouteBloc>(context).add(
    RouteEvent.delete(page),
  );
}

class NoAnimationPage extends Page<dynamic> {
  final Widget child;

  const NoAnimationPage({
    LocalKey? key,
    required this.child,
  }) : super(key: key);

  @override
  Route<dynamic> createRoute(BuildContext context) => PageRouteBuilder<dynamic>(
    settings: this,
    pageBuilder: (_, __, ___) => child,
  );
}
