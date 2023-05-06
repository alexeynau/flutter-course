import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignInPage extends StatefulWidget {
  static const String routeName = '/signin';
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool successSignIn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Вход'),
      ),
      body: Column(

        children: [

          // text that appears in case of succesful login
          if (successSignIn)
            const Center(
              child: Text('Добро пожаловать!'),
            ),
          
          // sign in form that contains all widgets for form
          signInForm(),

          // sign up button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: signInButton(context),
          )
        ],
      ),
    );
  }
  
  // sign in button realisation
  Form signInForm() {
    return Form(
          child: Column(
            children: [
              TextFormField(
                key: const Key('fieldEmail'),
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              TextFormField(
                key: const Key('fieldPhone'),
                keyboardType: const TextInputType.numberWithOptions(),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  labelText: 'Phone',
                ),
              ),

              // submit button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: submitButton(),
              )
            ],
          ),
        );
  }

  // sign in button realisation
  GestureDetector signInButton(BuildContext context) {
    return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/signup');
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.green,
              ),
              height: 60,
              width: 180,
              child: const Center(
                child: Text('Зарегистрироваться'),
              ),
            ),
          );
  }

  // submit button realisation
  GestureDetector submitButton() {
    return GestureDetector(
                  key: const Key('buttonSubmit'),
                  onTap: () {
                    setState(() {
                      successSignIn = true;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue,
                    ),
                    height: 60,
                    width: 180,
                    child: const Center(
                      child: Text('Войти'),
                    ),
                  ),
                );
  }
}
