import 'package:flutter/material.dart';
import 'package:regostration_page/ui/buttons/reg_button.dart';
import 'package:regostration_page/ui/form_fields/dropdown_form_field/dropdown_form_field.dart';
import 'package:regostration_page/ui/form_fields/text_form_field/text_form_field.dart';

class RegPage extends StatefulWidget {
  const RegPage({super.key});

  @override
  _RegPageState createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  // placeholders for inputs fields
  final List<String> _textFieldList = [
    'Имя',
    'Мобильный телефон',
    'Email',
  ];

  final List<String> _citiesList = [
    'City1',
    'City2',
    'City3',
    'City4',
    'City5',
    'City6',
    'City7',
    'City8',
    'City9',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Icon(Icons.arrow_back),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // title
                const Text(
                  'Регистрация',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 32,
                  ),
                ),

                // inputs
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
                  child: Column(
                    children: [
                      // input fields
                      ..._textFieldList.map((e) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: MyTextFromField(
                            label: e,
                          ),
                        );
                      }).toList(),

                      // dropdown field
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: MyDropDownFormField(
                          hintText: 'Город проживания',
                          items: {for (var element in _citiesList) element : element },
                        ),
                      )
                    ],
                  ),
                ),

                // registration button
                const Padding(
                  padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
                  child: RegButton(
                    label: 'Зарегистрироваться',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
