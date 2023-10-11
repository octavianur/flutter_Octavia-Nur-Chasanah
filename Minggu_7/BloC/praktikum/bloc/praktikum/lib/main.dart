import 'package:assets_dialog_bottomsheet_navigation/bloc/form_name/form_name_bloc.dart';
import 'package:assets_dialog_bottomsheet_navigation/routes/routes.dart';
import 'package:assets_dialog_bottomsheet_navigation/screen/contact/contactScreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'bloc/form_phone/form_phone_bloc.dart';
import 'bloc/form_submit/form_submit_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<FormNameBloc>(
          create: (context) => FormNameBloc(),
        ),
        BlocProvider<FormPhoneBloc>(
          create: (context) => FormPhoneBloc(),
        ),
        BlocProvider<FormSubmitBloc>(
          create: (context) => FormSubmitBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: RoutesNavigation.ContactProviderPage,
        routes: {
          RoutesNavigation.ContactProviderPage: (_) => ContactScreen(),
        },
      ),
    );
  }
}
