import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_10/tools/email_validator.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName = '/signup';
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool successSignUp = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Регистрация'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            if (successSignUp)
              const Center(
                child: Text('Вы успешно зарегистрировались'),
              ),
            signUpForm(),
            if (successSignUp)
              signUpButton(context)
          ],
        ),
      ),
    );
  }

  Form signUpForm() {
    return Form(
            child: Column(
              children: [
                TextFormField(
                  key: const Key('fieldFirstName'),
                  enabled: !successSignUp,
                  decoration: const InputDecoration(
                    labelText: 'Имя',
                  ),
                ),
                TextFormField(
                  key: const Key('fieldLastName'),
                  enabled: !successSignUp,
                  decoration: const InputDecoration(
                    labelText: 'Фамилия',
                  ),
                ),
                TextFormField(
                  key: const Key('fieldEmail'),
                  enabled: !successSignUp,
                  
                  validator: (value) {
                    if (value == '') return 'Пустое поле!';
                    if(!isValidEmail(value!)) return 'Неккоректный email!';
                    return null;
                  },
                  
                  decoration: const InputDecoration(
                    
                    errorStyle: TextStyle(
                      color: Colors.red,
                    ),
                    labelText: 'Email',
                  ),
                ),
                TextFormField(
                  key: const Key('fieldPhone'),
                  enabled: !successSignUp,
                  keyboardType: const TextInputType.numberWithOptions(),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Phone',
                  ),
                ),
                submitButton()
              ],
            ),
          );
  }

  GestureDetector submitButton() {
    return GestureDetector(
                  key: const Key('buttonSubmit'),
                  onTap: () {
                    setState(() {
                      successSignUp = true;
                    });
                  },
                  child: Container(
                    color: Colors.blue,
                    height: 60,
                    width: 180,
                    child: const Center(
                      child: Text('Зарегистрироваться'),
                    ),
                  ),
                );
  }

  GestureDetector signUpButton(BuildContext context) {
    return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/signin');
              },
              child: Container(
                color: Colors.green,
                height: 60,
                width: 180,
                child: const Center(
                  child: Text('Войти'),
                ),
              ),
            );
  }
}
