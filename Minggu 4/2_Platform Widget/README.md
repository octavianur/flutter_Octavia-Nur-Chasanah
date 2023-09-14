# Platform Widget 

1. MaterialApp
Widget dasar yang mengemas seluruh widget dalam Aplikasi, digunakan pada Android dan diimport dari package:flutter/material.dart

    Struktur
    > Widget pertama dibuka pada bagian home
    ex: 
    MaterialApp(
        theme: ThemeData.light(),
        home: HomePage(),
    );

    > Halaman dapat diatur menggunakan routes dan initialRoute
    ex: 
    MaterialApp(
        theme: ThemeData.light(),
        initialRoute: 'home',
        routes: {
            'home': (_) => const HomePage(),
        },
    );

2. Scaffold
Membuat sebuah halaman, Scaffold dalam satu halaman biasanya hanya terdapat satu saja
    ex: 
    Scaffold(
        appBar: AppBar(),
        drawer: Drawer(),
        body: Center(),
        bottomNavigationBar: BottomNavigationBar(),
    );

3. CupertinoApp
Widget dasar yang mengemas seluruh widget pada sistem iOS, dan di import dari package:flutter/cupertino.dart

    Struktur 
    > Variable _themeDark dibuat untuk menyimpan tema, tidak menyediakan ThemeData.dark()

    > Halaman pertama kali dibuka sama dengan materialApp yaitu pada bagian home

    ex: 
    CupertinoApp(
        theme: _themeDark,
        home: const HomePage(),
    );

4. CupertinoPageScaffold
Membuat sebuah halaman pada CupertinoApp
    ex:
    CupertinoPageScaffold(
        navigationBaar: CupertinoNavgationBar(),
        child: Center(..),
    );