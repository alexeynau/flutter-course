extension SqrtCalculator on num {
  num nSqrt(n) {
    if (this < 0) {
      throw ArgumentError('NumIsLessThanZeroException');
    }

    num eps = 0.00001;
    num xPrev = 1;
    num xNext = ((n - 1) * xPrev + this / xPrev.pow(n - 1)) / n;
    while ((xNext - xPrev).abs() > eps) {
      xPrev = xNext;
      xNext = ((n - 1) * xPrev + this / xPrev.pow(n - 1)) / n;
    }

    return xNext;
  }

  num pow(int power) => (power > 0) ? this * pow(power - 1) : 1;
}
