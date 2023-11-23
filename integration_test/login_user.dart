import 'package:finalproject/view/dashboard.dart';
import 'package:finalproject/view/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:finalproject/main.dart' as app;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Login Test', (WidgetTester tester) async {

    await Firebase.initializeApp();

    app.main();
    await tester.pumpWidget(const MaterialApp(
      home: Login(),
    ));

    await tester.enterText(find.byType(TextFormField).first, 'user@gmail.com');
    await tester.enterText(find.byType(TextFormField).last, 'user');

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.byType(Dashboard), findsOneWidget);
  });
}