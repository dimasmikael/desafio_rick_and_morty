import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../base.service.dart';

class Loading {
  void startLoading(context) {
    BaseService.systemColors.loadingColors();

    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.5),
      builder: (BuildContext context) => const Center(
          child: SpinKitWave(
        color: Colors.amber,
        size: 50.0,
      )),
    );
  }

  void stopLoading(context) {
    BaseService.systemColors.setDefaultNavigationAndStatusBar();
    Navigator.pop(context);
  }
}
