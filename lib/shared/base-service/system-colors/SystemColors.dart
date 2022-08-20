import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemColors {
  final List<Brightness> _lastStatusBarBrightness = [];
  final List<Color> _lastStatusBarBarColor = [];

  final List<Color> _lastNavigationBarColor = [];
  final List<Brightness> _lastNavigationBarIconBrightness = [];

  int length = 0;

  void setDefaultNavigationAndStatusBar() {
    _lastStatusBarBrightness.add(Brightness.light);
    _lastStatusBarBarColor.add(const Color(0xffffb400));

    _lastNavigationBarColor.add(const Color(0xffffb400));
    _lastNavigationBarIconBrightness.add(Brightness.dark);

    length++;

    Future.delayed(const Duration(milliseconds: 1)).then((value) =>
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarColor: Color(0xffffb400),
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.dark)));
  }

  void loadingColors() {
    Future.delayed(const Duration(milliseconds: 1)).then((value) =>
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarColor: Color.fromRGBO(
                _lastStatusBarBarColor.last.red,
                _lastStatusBarBarColor.last.green,
                _lastStatusBarBarColor.last.blue,
                0.5),
            systemNavigationBarColor: Color.fromRGBO(
                _lastNavigationBarColor.last.red,
                _lastNavigationBarColor.last.green,
                _lastNavigationBarColor.last.blue,
                0.5),
            systemNavigationBarIconBrightness: Brightness.dark)));
  }
}
