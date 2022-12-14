import 'package:desafio_rick_and_morty/shared/style/style_text.dart';
import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({Key? key, required this.title, required this.widgets})
      : super(key: key);
  final String? title;
  final Widget? widgets;

  Card customCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(15),
      elevation: 10,
      child: Column(
        children: <Widget>[
          ListTile(
              contentPadding: const EdgeInsets.fromLTRB(15, 10, 25, 0),
              title: textTitle(title!),
              subtitle: widgets),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return customCard();
  }
}
