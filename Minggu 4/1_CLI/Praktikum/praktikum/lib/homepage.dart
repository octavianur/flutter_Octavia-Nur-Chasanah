import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Hello Alterra",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700
          ),
        ),
        backgroundColor: Colors.purple[100],
      ),
      body: const Center(
        child: Text(
          "Nama Saya Octavia Nur Chasanah",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700
          ),
        ),
      ),
    );
  }
}