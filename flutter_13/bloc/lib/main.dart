import 'package:bloc_managment/domain/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/my_app.dart';
import 'package:overlay_support/overlay_support.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainBloc>(
            create: (context) => MainBloc(),
          ),
      ],
      child: OverlaySupport.global(child: MyApp()),
    );
  }
}
