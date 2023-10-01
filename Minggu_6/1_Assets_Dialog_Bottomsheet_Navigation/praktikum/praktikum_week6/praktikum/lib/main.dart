import 'package:assets_dialog_bottomsheet_navigation/screen/contact/contactScreen.dart';
import 'package:assets_dialog_bottomsheet_navigation/screen/galeri/galeriScreen.dart.dart';
import 'package:assets_dialog_bottomsheet_navigation/screen/galeri/detailScreen.dart.dart';
import 'package:assets_dialog_bottomsheet_navigation/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutesNavigation.GaleriScreen,
      routes: {
        RoutesNavigation.GaleriScreen: (_) => const GaleriScreen(),
        RoutesNavigation.PhotoScreen : (_) => PhotoScreen(),
        RoutesNavigation.ContactScreen : (_) => AdvanceForm(),
      },
    );
  }
}