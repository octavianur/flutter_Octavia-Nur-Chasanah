import 'package:flutter/material.dart';

class ContactModel {
  final String name;
  final String phone;
  final DateTime date;
  final Color color;
  final String fileName;


  ContactModel({
    required this.name, 
    required this.phone,
    required this.date, 
    required this.color,
    required this.fileName,
  });
}