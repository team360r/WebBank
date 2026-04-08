import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wwwbank/screens/dashboard/dashboard_screen.dart';

void main() {
  testWidgets('dashboard shows all account names', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: DashboardScreen(accessible: true)),
      ),
    );

    expect(find.text('Everyday Checking'), findsOneWidget);
    expect(find.text('Savings Goal'), findsOneWidget);
    expect(find.text('Credit Card'), findsOneWidget);
  });

  testWidgets('dashboard shows recent transactions section', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: DashboardScreen(accessible: true)),
      ),
    );

    expect(find.text('Recent Transactions'), findsOneWidget);
  });

  testWidgets('dashboard shows quick actions section', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: DashboardScreen(accessible: true)),
      ),
    );

    expect(find.text('Quick Actions'), findsOneWidget);
  });
}
