import 'package:flutter/material.dart';
import 'package:flutter_10/pages/sign_up_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_10/main.dart';

void main() {
  testWidgets('sign up test', (widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(home: SignUpPage()));
    expect(find.byKey(const Key('fieldEmail')), findsOneWidget);
    expect(find.byKey(const Key('fieldPhone')), findsOneWidget);
    expect(find.byKey(const Key('fieldFirstName')), findsOneWidget);
    expect(find.byKey(const Key('fieldLastName')), findsOneWidget);
    expect(find.byKey(const Key('buttonSubmit')), findsOneWidget);
    expect(find.text('Вы успешно зарегистрировались!'), findsNothing);

    // fill first name
    await widgetTester.enterText(
        find.byKey(const Key('fieldFirstName')), 'Alex');
    expect(find.text('Alex'), findsOneWidget);
    // fill phone field
    await widgetTester.enterText(
        find.byKey(const Key('fieldLastName')), 'Nau');
    expect(find.text('Nau'), findsOneWidget);
    // fill email field
    await widgetTester.enterText(
        find.byKey(const Key('fieldEmail')), 'test@test.com');
    expect(find.text('test@test.com'), findsOneWidget);
    // fill phone field
    await widgetTester.enterText(
        find.byKey(const Key('fieldPhone')), '8900909090');
    expect(find.text('8900909090'), findsOneWidget);

    // press submit button
    await widgetTester.tap(find.byKey(const Key('buttonSubmit')));
    await widgetTester.pump();

    // expected text 'Вы успешно зарегистрировались!'
    expect(find.text('Вы успешно зарегистрировались'), findsOneWidget);
  });
}
