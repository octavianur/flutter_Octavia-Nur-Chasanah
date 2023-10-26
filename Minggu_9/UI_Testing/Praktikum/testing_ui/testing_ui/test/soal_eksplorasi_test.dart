import 'package:advance_form/view/Soal_Eksplorasi/soal_eksplorasi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('title gallery', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: GaleriScreen(), //Halaman belum selesai dibuat
    ));

    expect(find.text('Gallery'), findsOneWidget);
  });

  testWidgets('Body harus memiliki title dan Image',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: GaleriScreen(), //Halaman belum selesai dibuat
    ));

    expect(find.text('Picturess'), findsOneWidget);
    expect(find.byType(Image), findsWidgets);
  });
}
