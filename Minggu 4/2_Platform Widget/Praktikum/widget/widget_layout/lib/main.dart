// import 'package:flutter/material.dart';
// import 'package:widget_layout/prioritas1.dart';
// import 'package:widget_layout/prioritas1_2.dart';


// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       themeMode: ThemeMode.dark,
//       // theme: ThemeData.dark(),
//       theme: ThemeData.light(),
//       debugShowCheckedModeBanner: false,
//       // home:  halamanSatu(),
//       home: HalamanDua(),
//     );
//   }
// }

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:widget_layout/prioritas2.dart';

// void main() {
//   runApp(MyCupertinoApp());
// }

// class MyCupertinoApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoApp(
//       theme: CupertinoThemeData(
//         brightness: Brightness.dark, // Set the brightness to dark
//       ),
//       home: Cupertino(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:widget_layout/eksplorasi.dart';


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
      themeMode: ThemeMode.dark,
      // theme: ThemeData.dark(),
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      // home:  halamanSatu(),
      home: eksplorasi(),
    );
  }
}