import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/http_unit_test/user_model.dart';

import 'package:flutter_testing/pages/homescreen.dart';

void main() {
  testWidgets(
    'Displays List of users with title as name and  subtitle as email',
    (tester) async {
      final users = [
        User(id: 1, name: 'Nitesh Paudel', email: 'netesh.paudel@gmail.com'),
        User(id: 2, name: 'Netesh', email: 'netesh@gmail.com'),
      ];

      Future<List<User>> mockFetchUsers() {
        return Future.delayed(
          const Duration(seconds: 1),
          () => users,
        );
      }

      await tester.pumpWidget(
        MaterialApp(
          home: HomeScreen(
            futureUsers: mockFetchUsers(),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ListTile), findsNWidgets(users.length));

      for (final user in users) {
        expect(find.text(user.name), findsOneWidget);
        expect(find.text(user.email), findsOneWidget);
      }
    },
  );
}
