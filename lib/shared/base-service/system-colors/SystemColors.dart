import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemColors {
  List<Brightness> _lastStatusBarBrightness = [];
  List<Color> _lastStatusBarBarColor = [];

  List<Color> _lastNavigationBarColor = [];
  List<Brightness> _lastNavigationBarIconBrightness = [];

  int length = 0;

  void setDefaultNavigationAndStatusBar() {
    this._lastStatusBarBrightness.add(Brightness.light);
    this._lastStatusBarBarColor.add(Color(0xffffb400));

    this._lastNavigationBarColor.add(Color(0xffffb400));
    this._lastNavigationBarIconBrightness.add(Brightness.dark);

    length++;

    Future.delayed(Duration(milliseconds: 1)).then((value) =>
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarColor: Color(0xffffb400),
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.dark)));
  }

  void backSystemToLastColors() {
    Future.delayed(Duration(milliseconds: 1)).then((value) =>
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarBrightness:
                this._lastStatusBarBrightness[this.length > 1 ? length - 2 : 0],
            statusBarColor:
                this._lastStatusBarBarColor[this.length > 1 ? length - 2 : 0],
            systemNavigationBarColor:
                this._lastNavigationBarColor[this.length > 1 ? length - 2 : 0],
            systemNavigationBarIconBrightness:
                this._lastNavigationBarIconBrightness[
                    this.length > 1 ? length - 2 : 0])));
  }

  void loadingColors() {
    Future.delayed(Duration(milliseconds: 1)).then((value) =>
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarColor: Color.fromRGBO(
                this._lastStatusBarBarColor.last.red,
                this._lastStatusBarBarColor.last.green,
                this._lastStatusBarBarColor.last.blue,
                0.5),
            systemNavigationBarColor: Color.fromRGBO(
                this._lastNavigationBarColor.last.red,
                this._lastNavigationBarColor.last.green,
                this._lastNavigationBarColor.last.blue,
                0.5),
            systemNavigationBarIconBrightness: Brightness.dark)));
  }

  void changeNavigationBarColor(Color color) {
    this._lastNavigationBarColor.add(color);
    this._lastNavigationBarIconBrightness.add(Brightness.dark);

    Future.delayed(Duration(milliseconds: 1)).then((value) =>
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            systemNavigationBarColor: color,
            systemNavigationBarIconBrightness: Brightness.dark)));
  }
}
