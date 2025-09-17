import 'package:flutter/material.dart';

class BuildTextFormFeild extends StatelessWidget {
  const BuildTextFormFeild({
    super.key,
    required this.label,
    required this.controller,
  });
  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: _inputDecoration(label),
    );
  }

  InputDecoration _inputDecoration(String label) => InputDecoration(
    labelText: label,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xff93501F)),
      borderRadius: BorderRadius.circular(8),
    ),
  );
}
