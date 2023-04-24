import 'package:flutter/material.dart';

class MyTextFromField extends StatelessWidget {
  final String? label;
  const MyTextFromField({super.key, this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 380,
      height: 60,
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFF1F1F1),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          labelText: label,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20.0,
            color: Color(0xFF6B6B6B),
          ),
          contentPadding: const EdgeInsets.fromLTRB(30, 30, 0, 30),
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
      ),
    );
  }
}
