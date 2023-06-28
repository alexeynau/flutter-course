import 'package:flutter/material.dart';
import 'package:flutter_21/features/presentation/bloc/bloc/list_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/presentation/pages/categories_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ListBloc>(
          create: (context) => ListBloc(),
        )
      ],
      child: const MaterialApp(
        home: CategoriesPage(),
      ),
    );
  }
}
