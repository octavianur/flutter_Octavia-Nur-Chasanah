import 'package:flutter/material.dart';
import 'package:project/constants/colorstyle_theme.dart';
import 'package:project/constants/textstyle_theme.dart';

class InputTextField extends StatelessWidget {
  final String label;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType; 
  final String? errorText;
  final int? maxLines;

  const InputTextField({
    super.key, 
    required this.label,  
    this.onChanged, 
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text, 
    this.errorText, 
    this.maxLines = 1,
  });
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            textAlign: TextAlign.left,
            label,
            style: ThemeTextStyle().labelLarge,
          ),
        ),
        const SizedBox(height: 5,),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: ColorStyle().darkgrey)
            ),
            errorText: errorText,
            filled: true,
            fillColor: ColorStyle().grey,
            hintStyle: ThemeTextStyle().bodyLarge.copyWith(
              color: ColorStyle().primary
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always
          ),
          keyboardType: keyboardType,
          onChanged: onChanged,
          validator: validator,
          maxLines: maxLines,
        ),
      ],
    );
  }
}
