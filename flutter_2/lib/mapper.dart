class Mapper {
  static Map strListToMap(List<String> lst) {
    Map resultMap = <String, int>{};
    for (var element in lst) {
      if (!resultMap.containsKey(element)) {
        resultMap[element] = 1;
      } else {
        resultMap[element]++;
      }
    }
    return resultMap;
  }
}
