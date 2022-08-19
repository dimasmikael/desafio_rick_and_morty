import 'package:flutter/material.dart';
import '../base.service.dart';

class Alert {
  void error(BuildContext context, String text) {
    showDialog(
        context: context,
        builder: (BuildContext context) =>
            AlertDialog(title: Text('Atenção'), content: Text(text))).then(
            (val) => {BaseService.systemColors.setDefaultNavigationAndStatusBar()});
  }

  void success(BuildContext context, String text) {
    showDialog(
        context: context,
        builder: (BuildContext context) =>
            AlertDialog(title: Text('Atenção'), content: Text(text))).then(
            (val) => {BaseService.systemColors.setDefaultNavigationAndStatusBar()});
  }

  void successSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            text
        ),
        backgroundColor: Colors.green,
        action: SnackBarAction(
          label: "",
          textColor: Colors.white,
          onPressed: () {},
        ),
      ),
    );
  }

  void errorSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: Colors.red,
        action: SnackBarAction(
          label: "",
          textColor: Colors.white,
          onPressed: () {},
        ),
      ),
    );
  }

  void successSalvarForm(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            text
        ),
        backgroundColor: Colors.green,
        action: SnackBarAction(
          label: "",
          textColor: Colors.white,
          onPressed: () {},
        ),
      ),
    );
  }
}

