import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integrating_testing/screens/homepage.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integrating_testing/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('login page test', () {
    testWidgets('verify the login email and password ', (widgetTester) async {
      app.main();
      await widgetTester.pumpAndSettle();
      await widgetTester.enterText(
          find.byType(TextFormField).at(0), 'username');
      await widgetTester.enterText(
          find.byType(TextFormField).at(1), 'password');

      await widgetTester.tap(find.byType(ElevatedButton));
      await widgetTester.pumpAndSettle();

      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
