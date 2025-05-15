import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class AdaptativeTextField extends StatelessWidget {

  final String label;
  final TextEditingController controller;
  final Function onSubmitted;
  final TextInputType keyboardType;

  AdaptativeTextField({
    required this.label,
    required this.controller,
    required this.onSubmitted,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
      ? CupertinoTextField(
        onSubmitted: (String value) => onSubmitted(value),
        controller: controller,
        keyboardType: keyboardType as TextInputType?,
        key: ValueKey(label),
        placeholder: label,
      )
      : TextField(
        onSubmitted: (String value) => onSubmitted(value),
        controller: controller,
        keyboardType: keyboardType as TextInputType?,
        key: ValueKey(label),
        decoration: InputDecoration(labelText: label),
      );
  }
}
