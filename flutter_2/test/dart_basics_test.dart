import 'package:dart_basics/integeral.dart';
import 'package:dart_basics/num_parser_2.dart';
import 'package:dart_basics/solver.dart';
import 'package:dart_basics/user_manager.dart';
import 'package:test/test.dart';
import 'package:dart_basics/delimeters_calculator.dart';
import 'package:dart_basics/bin_coder.dart';
import 'package:dart_basics/num_parser.dart';
import 'package:dart_basics/mapper.dart';
import 'package:dart_basics/point.dart';
import 'package:dart_basics/sqrt_calculator.dart';


void main() {
  // first task
  test('greatestCommonDivisor', () {
    expect(DelimetersCalculator.greatestCommonDivisor(10, 15), 5);
  });

  test('leastCommonMultiple', () {
    expect(DelimetersCalculator.leastCommonMultiple(10, 15), 30);
  });

  test('toPrimeNumbersList', () {
    expect(DelimetersCalculator.toPrimeNumbersList(15), [3, 5]);
  });

  // second task
  test('bin', () {
    expect(BinCoder.bin(1654), '11001110110');
  });

  test('dec', () {
    expect(BinCoder.dec('11001110110'), 1654);
  });

  // third task
  test('getIntListFromString', () {
    expect(NumParser.getIntListFromString('sad 5 ads 44 sdzzx 96 asds'),
        [5, 44, 96]);
  });

  // fourth task
  test('strListToMap', () {
    expect(
        Mapper.strListToMap(['one', 'two', 'three', 'two', 'three', 'three']),
        {'one': 1, 'two': 2, 'three': 3});
  });

  // fifth task
  test('strListToNumList', () {
    expect(
        NumParser2.strListToNumList([
          'one, two, three, cat, dog',
          'zero, zero, zero',
          'nine, dog, zero, zero'
        ]),
        [
          [1, 2, 3],
          [0],
          [9, 0]
        ]);
  });

  // sixth task
  test('distanceTo', () {
    expect(Point.zero().distanceTo(Point(1, 0, 0)), 1);
  });

  test('triangleSquare', () {
    expect(
        Point.triangleSquare(Point.one(), Point(1, 1, 0), Point(1, 0, 1))
            .toStringAsFixed(1),
        '0.5');
  });

  // seven task
  test('nSqrt', () {
    expect(27.nSqrt(3).toStringAsFixed(1), '3.0');
  });

  // eight task
  UserManager userManager = UserManager([GeneralUser('lala@yandex.ru'), AdminUser('gogo@gmail.com')]);
  test('getUserEmails', () {
    expect(userManager.getUsersMails(), '[lala@yandex.ru, gmail.com]');
  });


  // ninth task
  Integral integral1 = Integral(MyFunction.f1, 0, 10, 1000);
  Integral integral2 = Integral(MyFunction.f2, 0, 10, 1000);

  test('compute f1', (){
    expect(integral1.compute().round(), 334);
  });
  test('compute f2', (){
    expect(integral2.compute().round(), 211);
  });

  // tenth task
  Matrix matrix = [
    [0, 5, 4, 3],
    [3, 4, 8, -1],
    [7, 2, 6, 6]
  ];
  test('solve', (){
    // checked in Photomath
    expect(Solver.solve(matrix), [1.8627450980392157, 2.0980392156862746, -1.872549019607843]);
  });
}


