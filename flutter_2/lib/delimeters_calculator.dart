class DelimetersCalculator {
  static int greatestCommonDivisor(int a, int b) {
    int tmp;

    if (a < b) {
      tmp = a;
      a = b;
      b = tmp;
    }

    while (b > 0) {
      a %= b;
      tmp = a;
      a = b;
      b = tmp;
    }

    return a;
  }

  static int leastCommonMultiple(int a, int b) {
    return a ~/ greatestCommonDivisor(a, b) * b;
  }

  static List toPrimeNumbersList(int num) {
    final resultList = [];
    int i = 2;

    while (i * i <= num) {
      while (num % i == 0) {
        num ~/= i;
        resultList.add(i);
      }
      i++;
    }

    if (num > 1) {
      resultList.add(num);
    }

    return resultList;
  }
}
