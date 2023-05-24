import 'package:flutter/material.dart';
import 'features/domain/bloc/bloc_factory.dart';
import 'features/presentation/my_app.dart';

void main() {
  initializeBlocs();
  runApp(const MyApp());
}
