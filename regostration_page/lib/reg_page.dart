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

  double h = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: Image.asset('assets/images/background.png').image),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 24, top: 50),
                          child: IconButton(
                            iconSize: 40,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: Color(0xFF363636),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // title
                  const Text(
                    'Регистрация',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF363636),
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
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                h = (h == 0) ? 100 : 0;
                              });
                            },
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              color: Colors.amber,
                              
                            ),
                          )
                          ),
                        
                      ],
                    ),
                  ),
                  AnimatedContainer(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    duration: const Duration(milliseconds: 100),
                    width: h,
                    color: Colors.red,
                    height: h,
                    child: ListView(
                      children: [
                        Text('asdd'),
                        Text('asdd'),
                        Text('asdd'),
                        Text('asdd'),
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

                  // private policy agreement
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15, left: 60, right: 60, bottom: 58),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        text: 'Нажимая зарегистрироваться, вы соглашаетесь с ',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Color(0xFF6B6B6B)),
                        children: <TextSpan>[
                          TextSpan(
                            mouseCursor: MaterialStateMouseCursor.clickable,
                            text: 'Политикой Конфиндециальности',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Color(0xFF6B6B6B),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
