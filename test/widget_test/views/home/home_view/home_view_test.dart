import 'package:desafio_rick_and_morty/views/home/home_view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget makeTestableWidget(Widget widget) => MaterialApp(
      home: widget,
    );

void main() {
  testWidgets(
    "Test the search field",
    (WidgetTester tester) async {
      final addField = find.byKey(const ValueKey("addField"));

      await tester.pumpWidget(makeTestableWidget(const HomeView()));

      await tester.enterText(addField, "Rick");

      await tester.pump(
        const Duration(seconds: 2000),
      );

      expect(find.text("Rick"), findsOneWidget);
    },
  );
}
