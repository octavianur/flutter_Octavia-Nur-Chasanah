import 'package:advance_form/view/Splash_Screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Title Splash Screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: SplashScreen(), //Halaman belum selesai dibuat
    ));

    expect(find.text('Splash Screen'), findsOneWidget);
  });
}