import 'package:advance_form/view/Advance_Screen/advance_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Title Contacts', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: AdvanceForm(),
    ));
    expect(find.text('Contacts'), findsOneWidget);
  });

  testWidgets('Body terdapat icon, header, subtitle, input textfield name, input textfield phone, button submit', (WidgetTester tester)async{
    await tester.pumpWidget(const MaterialApp(
      home: AdvanceForm(),
    ));
    expect(find.byIcon(Icons.phone_iphone_outlined), findsOneWidget);
    expect(find.text('Create New Contacts'), findsOneWidget);
    expect(find.text("A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made. "), findsOneWidget);
    expect(find.widgetWithText(TextFormField, 'Nama'), findsOneWidget);
    expect(find.widgetWithText(TextFormField, 'Nomor'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Submit'), findsOneWidget);
  });
}
