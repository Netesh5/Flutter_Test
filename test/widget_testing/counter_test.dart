import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/pages/homepage.dart';

void main() {
  testWidgets(
      'given counter is zero when increment is pressed then it increments to 1',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: MyHomePage(
        title: ".....",
      ),
    ));
    final counter = find.text('0');

    expect(counter, findsOneWidget);

    final btn = find.byType(FloatingActionButton);

    // tester helps to simulate the user action like : tapping etc

    await tester.tap(btn);
    await tester.pump();
  });
}
