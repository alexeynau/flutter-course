import 'package:flutter/material.dart';
import 'package:flutter_21/features/data/models/category_model.dart';

class ElementPage extends StatelessWidget {
  final Content content;
  const ElementPage({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(content.name),
      ),
      body: Text(content.description),
    );
  }
}
