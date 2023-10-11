import 'package:flutter/material.dart';

class buildWidgetElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const buildWidgetElevatedButton({
    super.key, 
    required this.title, 
    required this.onPressed
  });
 
  @override
  Widget build(BuildContext context) {
    double halfScreenWidth = MediaQuery.of(context).size.width / 4;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        width: halfScreenWidth,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.deepPurpleAccent,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            ),

          ),
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white
            ),
          )
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white, // Warna border
            width: 1.0, // Lebar border
          ),
          borderRadius: BorderRadius.circular(5)
        ),
      ),
    );
  }
}