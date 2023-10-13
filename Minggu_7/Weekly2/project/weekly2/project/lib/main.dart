import 'package:flutter/material.dart';
import 'package:project/pages/about_page/about_page.dart';
import 'package:project/pages/contact_page/contact_page.dart';
import 'package:project/pages/login_page/login_page.dart';
import 'package:project/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code Competence 2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesNavigation.ContactPage,
      routes: {
        RoutesNavigation.ContactPage: (_) => ContactPage(),
        RoutesNavigation.LoginPage: (_) => LoginPage(),
        RoutesNavigation.AboutPage: (_) => AboutPage(),
      },
    );
  }
}
