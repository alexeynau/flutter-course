import 'package:flutter/material.dart';

class MyDropDownFormField extends StatefulWidget {
  final String hintText;
  final Map<String, String> items;
  const MyDropDownFormField({super.key, required this.hintText, required this.items});

  @override
  State<MyDropDownFormField> createState() => _MyDropDownFormFieldState(hintText, items);
}

class _MyDropDownFormFieldState extends State<MyDropDownFormField> {
  final String hintText;
  final Map<String, String> items;
  final List<DropdownMenuItem> _dropDownItems = [];

  _MyDropDownFormFieldState(this.hintText, this.items);

  @override
  void initState() {
    super.initState();
    items.forEach((key, value) =>
        _dropDownItems.add(DropdownMenuItem(value: value, child: Text(key))));
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 380,
      height: 60,
      child: DropdownButtonFormField(
        validator: (value) => value == null ? hintText : null,
        value: null,
        items: _dropDownItems,
        onChanged: (e) {},
        itemHeight: 60,
        icon: const Icon(Icons.keyboard_arrow_down_sharp),
        iconSize: 36,
        menuMaxHeight: 300,
        dropdownColor: const Color(0xFFF1F1F1),
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20.0,
          color: Color(0xFF6B6B6B),
        ),
        borderRadius: BorderRadius.circular(10),
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: const Color(0xFFF1F1F1),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20.0,
            color: Color(0xFF6B6B6B),
          ),
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20.0,
            color: Color(0xFF6B6B6B),
          ),
          contentPadding: const EdgeInsets.fromLTRB(30, 0, 21, 36),
        ),
      ),
    );
  }
}
