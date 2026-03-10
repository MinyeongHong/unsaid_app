import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:unsaid_app/app.dart';

BuildContext get context => CustomNavigator.context;

MediaQueryData get mediaQueryData => MediaQuery.of(context);

Box get box => Hive.box('unsaid');
