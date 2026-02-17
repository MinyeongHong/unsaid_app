import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:unsaid_app/app.dart';

final MediaQueryData mediaQueryData = MediaQuery.of(context);

BuildContext get context => CustomNavigator.context;

Box get box => Hive.box('unsaid');
