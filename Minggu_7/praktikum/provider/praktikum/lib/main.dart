import 'package:assets_dialog_bottomsheet_navigation/provider/button_submit_provider.dart';
import 'package:assets_dialog_bottomsheet_navigation/provider/name_textfield_provider.dart';
import 'package:assets_dialog_bottomsheet_navigation/provider/phone_textfield_provider.dart';
import 'package:assets_dialog_bottomsheet_navigation/routes/routes.dart';
import 'package:assets_dialog_bottomsheet_navigation/screen/galeri/detailScreen.dart.dart';
import 'package:assets_dialog_bottomsheet_navigation/screen/galeri/galeriScreen.dart.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen/contact/contact_provider_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => NameTextFieldNotifier()),
      ChangeNotifierProvider(create: (_) => PhoneTextFieldNotifier()),
      ChangeNotifierProvider(
          create: (context) => ButtonSubmitNotifier(context)),
    ],
    child: const MyApp(),
  ));
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
      initialRoute:
          RoutesNavigation.ContactProviderPage, 
      routes: {
        RoutesNavigation.ContactProviderPage: (context) => ContactProviderPage(),
        RoutesNavigation.GaleriScreen: (context) => GaleriScreen(),
        RoutesNavigation.PhotoScreen: (context) => PhotoScreen(),
      },
    );
  }
}
