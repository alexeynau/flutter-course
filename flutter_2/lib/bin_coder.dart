import 'dart:math';

class BinCoder {
  static String bin(int n) => (n > 0) ? bin(n ~/ 2) + (n % 2).toString() : '';

  static num dec(String n) => (n.length > 1)
      ? pow(2 * int.parse(n[0]), n.length - 1) + dec(n.substring(1))
      : int.parse(n);
}
