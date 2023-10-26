// import 'package:advance_form/view/Advance_Screen/advance_screen.dart';
import 'package:advance_form/view/Soal_Eksplorasi/soal_eksplorasi.dart';
// import 'package:advance_form/view/Splash_Screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Advance User Input',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const AdvanceForm(),
      // home: const SplashScreen(),
      home: GaleriScreen(),
    );
  }
}
