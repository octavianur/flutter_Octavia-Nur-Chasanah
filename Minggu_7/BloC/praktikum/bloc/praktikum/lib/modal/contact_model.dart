import 'package:flutter/material.dart';

class ContactModel {
  String name;
  String phone;
  final DateTime? date;
  final Color? color;
  final String? fileName;
  final bool isEdited;
  int? index;

  ContactModel({
    this.index,
    required this.name,
    required this.phone,
    this.date,
    this.color,
    this.fileName,
    this.isEdited = false,
  });
}
