import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wwwbank/screens/login/login_screen.dart';

void main() {
  testWidgets('login screen shows app name and sign in button', (tester) async {
    bool loginCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: LoginScreen(
          accessible: true,
          onLogin: () => loginCalled = true,
        ),
      ),
    );

    expect(find.text('wwwBank'), findsOneWidget);
    expect(find.text('Sign In'), findsOneWidget);

    await tester.tap(find.text('Sign In'));
    expect(loginCalled, isTrue);
  });

  testWidgets('login screen has email and password fields', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: LoginScreen(
          accessible: true,
          onLogin: () {},
        ),
      ),
    );

    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
  });
}
