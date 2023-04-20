import 'package:dart_basics/num_parser.dart';

class NumParser2 {
  static final _numbers = {
    'one': 1,
    'two': 2,
    'three': 3,
    'four': 4,
    'fifth': 5,
    'six': 6,
    'seven': 7,
    'eight': 8,
    'nine': 9,
    'zero': 0
  };

  static List strListToNumList(List<String> strings) {
    List resultList = <List<int?>>[];

    for (var element in strings) {
      _numbers.forEach((key, value) {
        element = element.replaceAll(key, '$value');
      });

      resultList.add(NumParser.getIntListFromString(element.replaceAll(',', ''))
          .toSet()
          .toList());
    }

    return resultList;
  }
}
