import 'package:flutter_test/flutter_test.dart';

import 'package:frc_app/main.dart';

void main() {
  testWidgets('App loads sign up options screen', (WidgetTester tester) async {
    await tester.pumpWidget(const FrcApp());
    await tester.pumpAndSettle();

    // Tap skip to go to sign up options screen
    await tester.tap(find.text('Skip to Login'));
    await tester.pumpAndSettle();

    expect(find.text('Sign With Google'), findsOneWidget);
    expect(find.text('Your Phone Number'), findsOneWidget);
  });
}
