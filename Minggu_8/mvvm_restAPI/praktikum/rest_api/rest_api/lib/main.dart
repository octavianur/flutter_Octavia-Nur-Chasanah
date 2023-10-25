import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api/screen/contact_screen/contact_view_model.dart';
import 'package:rest_api/screen/dicebar/dicebear_screen.dart';
import 'package:rest_api/screen/dicebar/dicebear_view_model.dart';
import 'package:rest_api/screen/put_request/put_request_view_model.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => DicebearViewModel()),
    ChangeNotifierProvider(create: (context) => ContactViewModel()),
    ChangeNotifierProvider(create: (context) => RequestViewmodel()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DicebearScreen(),
    );
  }
}
