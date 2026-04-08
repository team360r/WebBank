import 'package:flutter_test/flutter_test.dart';

import 'package:webbank/app.dart';

void main() {
  testWidgets('app renders login screen when not logged in', (WidgetTester tester) async {
    await tester.pumpWidget(const WebBankApp());
    await tester.pumpAndSettle();

    expect(find.text('WebBank'), findsOneWidget);
    expect(find.text('Sign in to your account'), findsOneWidget);
  });
}
