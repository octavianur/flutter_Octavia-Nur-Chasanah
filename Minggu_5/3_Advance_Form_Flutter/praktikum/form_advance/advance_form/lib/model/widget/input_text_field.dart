import 'package:advance_form/model/theme/color_style.dart';
import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          errorText: errorText,
          filled: true,
          fillColor: ColorStyle().m3SysLightSurfaceVariant,
          label: Text(label),
          labelStyle: ThemeTextStyle().bodySmall.copyWith(
            color: ColorStyle().m3SysLightOnSufraceVariant
          ),
          hintText: hintText,
          hintStyle: ThemeTextStyle().bodyLarge.copyWith(
            color: ColorStyle().m3SysLightOnSufraceVariant
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always
        ),
        keyboardType: keyboardType,
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
