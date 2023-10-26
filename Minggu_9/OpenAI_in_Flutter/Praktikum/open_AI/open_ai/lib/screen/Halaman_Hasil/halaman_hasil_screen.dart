import 'package:flutter/material.dart';

class HalamanHasilScreen extends StatelessWidget {
  final String data;

  const HalamanHasilScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Result',
          ),
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(data),
        ));
  }
}