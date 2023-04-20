class NumParser {
  static List<int?> getIntListFromString(String str) {
    List<int?> resultList = <int?>[];
    str.split(' ').forEach((element) {
      resultList.add((int.tryParse(element)));
    });
    resultList.removeWhere((element) => element == null);
    return resultList;
  }
}
