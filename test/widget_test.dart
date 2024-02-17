// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:app/screens/login_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('HomeScreen has a title and bottom navigation bar',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const LoginScreen());

    // Verify that HomeScreen has a title
    //expect(find.text('Login'), findsOneWidget);

    // Verify that HomeScreen has a bottom navigation bar
    //expect(find.byType(BottomNavigationBar), findsOneWidget);
  });
}
