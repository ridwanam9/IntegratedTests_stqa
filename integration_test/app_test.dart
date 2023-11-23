import 'package:finalproject/view/admin_dashboard.dart';
import 'package:finalproject/view/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:finalproject/main.dart' as app;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp();
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Login Test', (WidgetTester tester) async {

    // app.main();
    await tester.pumpWidget(MaterialApp(
      home: Login(),
    ));

    await tester.enterText(find.byType(TextFormField).first, 'admin@gmail.com');
    await tester.enterText(find.byType(TextFormField).last, 'admin');

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    await tester.pumpAndSettle(Duration(seconds: 5));

    expect(find.byType(DashboardAdmin), findsOneWidget);
  });
}