typedef Matrix = List<List<num>>;
typedef Vector = List<num>;

extension MatrixInterface on Matrix {
  Matrix toTriagonalMatrix() {
    sort((a, b) => (b[0].compareTo(a[0])));
    for (int i = 0; i < length - 1; i++) {
      for (int j = i + 1; j < length; j++) {
        this[j] =
            this[j].substract(this[i].multiply(this[j][i] / this[i][j - 1]));
      }
    }

    return this;
  }
}

extension ListOperations on List<num> {
  List<num> substract(List<num> other) {
    if (length != other.length) {
      throw ArgumentError('different length');
    }

    List<num> tmp = List.from(this);

    for (int i = 0; i < length; i++) {
      tmp[i] -= other[i];
    }

    return tmp;
  }

  List<num> multiply(num multiplier) {
    List<num> tmp = List.from(this);
    for (int i = 0; i < length; i++) {
      tmp[i] *= multiplier;
    }
    return tmp;
  }
}

class Solver {
  static List<num> solve(Matrix matrix) {
    matrix = matrix.toTriagonalMatrix();
    List<num> res = [];
    res.add(matrix.last.last / matrix.last[matrix.length - 1]);
    for (int i = matrix.length - 2; i >= 0; i--) {
      num sum = 0;
      for (int j = i + 1; j < matrix[0].length - 1; j++) {
        sum += matrix[i][j] * res.reversed.toList()[j - i - 1];
      }
      res.add((matrix[i].last - sum) / matrix[i][i]);
    }

    return res.reversed.toList();
  }
}

void main(List<String> args) {
  Matrix matrix = [
    [0, 5, 4, 3],
    [3, 4, 8, -1],
    [7, 2, 6, 6]
  ];

  print(Solver.solve(matrix));
}
