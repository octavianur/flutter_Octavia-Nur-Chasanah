import 'package:flutter/material.dart';

class PhotoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String imagePath = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Image"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 169, 119, 178),
      ),
      body: Center(
        child: Image.asset(imagePath),
      ),
    );
  }
}