import 'package:flutter/material.dart';
import 'package:rest_api/theme/color_style.dart';
import '../theme/text_style.dart';

class InputTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final String? errorText;

  const InputTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.onChanged,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            errorText: errorText,
            filled: true,
            fillColor: ColorStyle().white,
            label: Text(label),
            labelStyle: ThemeTextStyle()
                .bodySmall
                .copyWith(color: ColorStyle().darkgrey),
            hintText: hintText,
            hintStyle: ThemeTextStyle()
                .bodyLarge
                .copyWith(color: ColorStyle().darkgrey),
            floatingLabelBehavior: FloatingLabelBehavior.always),
        keyboardType: keyboardType,
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
