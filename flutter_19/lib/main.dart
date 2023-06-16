import 'package:flutter/material.dart';
import 'package:flutter_19/service.dart';

void main() {
  runApp(MainApp());
}

final PlatformService platformService = PlatformService();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController controller = TextEditingController();
  String text = '';
  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        text = controller.text;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
        ),
        SizedBox(
          height: 150,
        ),
        controller.text.isNotEmpty
            ? Text('${platformService.getStrLen(text)}')
            : Text('Введите текст')
      ],
    );
  }
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const MaterialApp(
        home: Scaffold(body: MyApp()

            // Center(
            //   child: Text('${platformService.getStrLen('wow')}'),
            // ),
            ),
      ),
    );
  }
}
