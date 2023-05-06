import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Sign in and Sign up test', () {
    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver!.close();
      }
    });

    final filedFinderEmail = find.byValueKey('fieldEmail');
    final filedFinderPhone = find.byValueKey('fieldPhone');
    final filedFinderSubmit = find.byValueKey('buttonSubmit');

    // test email field
    test('test email field', () async {
      await driver!.tap(filedFinderEmail);                  
      await driver!.waitFor(find.text(''));                 
      await driver!.enterText('test@test.com');             
      await driver!.waitFor(find.text('test@test.com'));  
    });

    // test phone field
    test('test phone field', () async {
      await driver!.tap(filedFinderPhone);               
      await driver!.waitFor(find.text(''));             
      await driver!.enterText('sdfsdfs');             
      await driver!.waitFor(find.text(''));               
      await driver!.enterText('5645640564');              
      await driver!.waitFor(find.text('5645640564'));     
    });

    // test submit button
    test('test submit button', () async {
      await driver!.tap(filedFinderSubmit);            
    });

    // expext text appearance after pressing the button
    test('test text appearance', () async {
      await driver!.waitFor(find.text('Добро пожаловать!'));
    });

  });
}