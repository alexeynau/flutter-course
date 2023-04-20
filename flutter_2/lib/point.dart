import 'dart:math';

class Point {
  num _x;
  num _y;
  num _z;

  Point(this._x, this._y, this._z);

  num distanceTo(Point another) {
    return sqrt(pow((another._x - _x), 2) +
        pow((another._y - _y), 2) +
        pow((another._z - _z), 2));
  }

  static num triangleSquare(Point a, Point b, Point c) {
    num ab = a.distanceTo(b);
    num ac = a.distanceTo(c);
    num bc = b.distanceTo(c);
    num p = (ab + ac + bc) / 2;

    return sqrt(p * (p - ab) * (p - ac) * (p - bc));
  }

  factory Point.zero() => Point(0, 0, 0);
  factory Point.one() => Point(1, 1, 1);
}
