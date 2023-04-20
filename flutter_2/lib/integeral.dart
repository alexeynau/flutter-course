import 'dart:math';

class Integral {
  num n;
  num a, b;
  Function(num) f;
  Integral(this.f, this.a, this.b, this.n);

  num compute(){
    num sum = 0;
    final num h = (b - a) / n;

    while (a < b){
      sum += f(a) * h;
      a += h;
    }
    return sum;
  }
}

class MyFunction {
  static num f1(num x) => x * x;
  static num f2(num x) => sqrt(x + 24) + x * x * 0.5 + 1/cos(x * 40); 
}