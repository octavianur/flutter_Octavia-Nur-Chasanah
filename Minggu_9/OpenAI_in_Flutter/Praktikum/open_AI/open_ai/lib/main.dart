import 'package:flutter/material.dart';
import 'package:open_ai/screen/Halaman_Utama/halaman_utama_screen.dart';
import 'package:open_ai/screen/Halaman_Utama/halaman_utama_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HalamanUtamaViewModel()),
      ],
      child: MaterialApp(
        title: 'Soal OpenAI',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HalamanUtamaScreen(),
      ),
    );
  }
}